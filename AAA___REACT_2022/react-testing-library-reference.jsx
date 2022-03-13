import {render, fireEvent, waitFor, screen} from '@testing-library/react';
import MyContextAgain from './contexts/MyContextAgain';
import FooBar from './FooBar';

describe('FooBar', () => {
    it('Should work', async () => {
        let onUnmountFn = jest.fn((n) => {});
        let component = render(<FooBar onUnmount={onUnmountFn}/>);
        let pTag = await component.findByTestId('abc'); // await find
        expect(pTag).toHaveTextContent('Hello');
    });

    it('Context should work', async () => {
        let ctx = {
            name: 'Erich',
            age: 20
        };
        let onUnmountFn = jest.fn((n) => {});
        let component = render(
            <MyContextAgain.Provider value={ctx}>
                <FooBar onUnmount={onUnmountFn}/>
            </MyContextAgain.Provider>
        );
        let pTag = component.getByTestId('context');
        expect(pTag).toHaveTextContent('name: Erich, age: 20');
    });

    it('State should work', () => {
        let onUnmountFn = jest.fn((n) => {});
        let component = render(<FooBar onUnmount={onUnmountFn}/>);
        let pTag = component.getByTestId('state-val');
        expect(pTag).toHaveTextContent('stateVal: 0');

        let btn = component.getByTestId("state-val-btn");

        fireEvent.click(btn);

        expect(pTag).toHaveTextContent('stateVal: 1');
    });

    it('effect shoud work', () => {
        let onUnmountFn = jest.fn((n) => {});
        let component = render(<FooBar onUnmount={onUnmountFn}/>);
        let pTag = component.getByTestId('effect');
        expect(pTag).toHaveTextContent('greetings: Hello from useEffect');
        component.unmount();
        expect(onUnmountFn).toHaveBeenCalledWith(123);
    })

    it('memo should work', () => {
        let onUnmountFn = jest.fn();
        let component = render(<FooBar onUnmount={onUnmountFn} />);
        let pTag = component.getByTestId('exp');
        expect(pTag).toHaveTextContent('expVal: $$$');
    });
});//
