interface Props {
  title?: string;
  total?: number;
  onAddEmployee?: () => void;
}

const Header = ({ title, total = 0, onAddEmployee }: Props) => {
  return (
    <div className="header">
      <div>
        <h1>{title || 'EMPLOYEE SCHEDULE'}</h1>
        <span className="count">
          <span className="six-two">{total}</span>{' '}
          {total === 1 ? 'Employee' : 'Employees'}
        </span>
      </div>

      <div className="actions">
        <button
          className="add"
          onClick={onAddEmployee}
        >
          + Add Employee
        </button>

        <button className="export">Export</button>
      </div>
    </div>
  );
};

export default Header;