/***************************************************************/
/* Code Writer (written by Anish M Mathew )                                 */
/*                                                                          */
/* This file was automatically generated using Code Writer                  */
/* Any manual changes to this file will be overwritten by a automated tool. */
/*                                                                          */
/* Date Generated : 06-01-2021 14:00:10                                      */
/*                                                                          */
/* More Details    --                                                       */
/*http://visualstudiogallery.msdn.microsoft.com/40d92d45-107e-4f83-b6c5-50a7e2419389*/
/****************************************************************************/
using System;

using MMS.data.Repository;
using MMS.data.Infrastructure;
namespace MMS.data.UnitOfWork
{
	
	public class UnitOfWork : IUnitOfWork
	{

		public IAspNetUsersRepository _aspnetusersRepository;
		public IRepresentativeRepository _representativeRepository;
		public ITransactionDetailRepository _transactiondetailRepository;
		public ITransactionHeaderRepository _transactionheaderRepository;
		public ITransactionOtherPicturesRepository _transactionotherpicturesRepository;
		public ITransactionReceivedPaperwordRepository _transactionreceivedpaperwordRepository;
		public ITransactionScalePicturesRepository _transactionscalepicturesRepository;
		public ITransectionSettingRepository _transectionsettingRepository;
		public ITransportationCommoditiesRepository _transportationcommoditiesRepository;
		public ITransportationLocationsRepository _transportationlocationsRepository;
		public IUserHistoryRepository _userhistoryRepository;
		public IUserAuditRepository _userauditRepository;
		public IAccountsRepository _accountsRepository;
		public IUsersRepository _usersRepository;
		public IOrderDetailRepository _OrderDetailRepository;
		public IOrderHeaderRepository _OrderHeaderRepository;
		public IConnectionFactory _connectionFactory;
		public UnitOfWork(IConnectionFactory connectionFactory)
		{
			_connectionFactory = connectionFactory;
		}
		public IAccountsRepository AccountsRepository
		{
			get
			{
				if (_accountsRepository == null)
				{
					_accountsRepository = new AccountsRepository(_connectionFactory);
				}
				return _accountsRepository;
			}
		}
		public IUsersRepository UsersRepository
		{
			get
			{
				if (_usersRepository == null)
				{
					_usersRepository = new UsersRepository(_connectionFactory);
				}
				return _usersRepository;
			}
		}
		public IAspNetUsersRepository AspNetUsersRepository
		{
			get
			{
				if (_aspnetusersRepository == null)
				{
					_aspnetusersRepository = new AspNetUsersRepository(_connectionFactory);
				}
				return _aspnetusersRepository;
			}
		}
		public IRepresentativeRepository RepresentativeRepository
		{
			get
			{
				if (_representativeRepository == null)
				{
					_representativeRepository = new RepresentativeRepository(_connectionFactory);
				}
				return _representativeRepository;
			}
		}
		public ITransactionDetailRepository TransactionDetailRepository
		{
			get
			{
				if (_transactiondetailRepository == null)
				{
					_transactiondetailRepository = new TransactionDetailRepository(_connectionFactory);
				}
				return _transactiondetailRepository;
			}
		}
		public ITransactionHeaderRepository TransactionHeaderRepository
		{
			get
			{
				if (_transactionheaderRepository == null)
				{
					_transactionheaderRepository = new TransactionHeaderRepository(_connectionFactory);
				}
				return _transactionheaderRepository;
			}
		}
		public ITransactionOtherPicturesRepository TransactionOtherPicturesRepository
		{
			get
			{
				if (_transactionotherpicturesRepository == null)
				{
					_transactionotherpicturesRepository = new TransactionOtherPicturesRepository(_connectionFactory);
				}
				return _transactionotherpicturesRepository;
			}
		}
		public ITransactionReceivedPaperwordRepository TransactionReceivedPaperwordRepository
		{
			get
			{
				if (_transactionreceivedpaperwordRepository == null)
				{
					_transactionreceivedpaperwordRepository = new TransactionReceivedPaperwordRepository(_connectionFactory);
				}
				return _transactionreceivedpaperwordRepository;
			}
		}
		public ITransactionScalePicturesRepository TransactionScalePicturesRepository
		{
			get
			{
				if (_transactionscalepicturesRepository == null)
				{
					_transactionscalepicturesRepository = new TransactionScalePicturesRepository(_connectionFactory);
				}
				return _transactionscalepicturesRepository;
			}
		}
		public ITransectionSettingRepository TransectionSettingRepository
		{
			get
			{
				if (_transectionsettingRepository == null)
				{
					_transectionsettingRepository = new TransectionSettingRepository(_connectionFactory);
				}
				return _transectionsettingRepository;
			}
		}
		public ITransportationCommoditiesRepository TransportationCommoditiesRepository
		{
			get
			{
				if (_transportationcommoditiesRepository == null)
				{
					_transportationcommoditiesRepository = new TransportationCommoditiesRepository(_connectionFactory);
				}
				return _transportationcommoditiesRepository;
			}
		}
		public ITransportationLocationsRepository TransportationLocationsRepository
		{
			get
			{
				if (_transportationlocationsRepository == null)
				{
					_transportationlocationsRepository = new TransportationLocationsRepository(_connectionFactory);
				}
				return _transportationlocationsRepository;
			}
		}

		public IUserHistoryRepository UserHistoryRepository
		{
			get
			{
				if (_userhistoryRepository == null)
				{
					_userhistoryRepository = new UserHistoryRepository(_connectionFactory);
				}
				return _userhistoryRepository;
			}
		}

		public IUserAuditRepository UserAuditRepository
		{
			get
			{
				if (_userauditRepository == null)
				{
					_userauditRepository = new UserAuditRepository(_connectionFactory);
				}
				return _userauditRepository;
			}
		}

        public IOrderDetailRepository OrderDetailRepository
        {
			get
			{
				if (_OrderDetailRepository == null)
				{
					_OrderDetailRepository = new OrderDetailRepository(_connectionFactory);
				}
				return _OrderDetailRepository;
			}
		}

        public IOrderHeaderRepository OrderHeaderRepository
		{
			get
			{
				if (_OrderHeaderRepository == null)
				{
					_OrderHeaderRepository = new OrderHeaderRepository(_connectionFactory);
				}
				return _OrderHeaderRepository;
			}
		}

		void IUnitOfWork.Complete()
		{
			throw new NotImplementedException();
		}
		#region IDisposable Support
		
		private bool disposedValue = false; // To detect redundant calls
		protected virtual void Dispose(bool disposing)
		{
			if (!disposedValue)
			
			{
				if (disposing)
				{
					// TODO: dispose managed state (managed objects).
				}
				// TODO: free unmanaged resources (unmanaged objects) and override a finalizer below.
				// TODO: set large fields to null.
				disposedValue = true;
			}
		}
		
		// TODO: override a finalizer only if Dispose(bool disposing) above has code to free unmanaged resources.
		// ~UnitOfWork() {
		//   // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
		//   Dispose(false);
		// }
		// This code added to correctly implement the disposable pattern.
		void IDisposable.Dispose()
		{
			// Do not change this code. Put cleanup code in Dispose(bool disposing) above.
			Dispose(true);
			// TODO: uncomment the following line if the finalizer is overridden above.
			// GC.SuppressFinalize(this);
		}
		#endregion
	}
}

