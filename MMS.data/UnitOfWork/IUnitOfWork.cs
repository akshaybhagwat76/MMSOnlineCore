/***************************************************************/
/* Code Writer (written by Akshay S Bhagwat )                                 */
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
namespace MMS.data.UnitOfWork
{
	public interface IUnitOfWork : IDisposable
	{
		IAspNetUsersRepository AspNetUsersRepository { get; }
		IRepresentativeRepository RepresentativeRepository { get; }
		ITransactionDetailRepository TransactionDetailRepository { get; }
		ITransactionHeaderRepository TransactionHeaderRepository { get; }
		IOrderDetailRepository OrderDetailRepository { get; }
		IOrderHeaderRepository OrderHeaderRepository { get; }
		ITransactionOtherPicturesRepository TransactionOtherPicturesRepository { get; }
		ITransactionReceivedPaperwordRepository TransactionReceivedPaperwordRepository { get; }
		ITransactionScalePicturesRepository TransactionScalePicturesRepository { get; }
		ITransectionSettingRepository TransectionSettingRepository { get; }
		ITransportationCommoditiesRepository TransportationCommoditiesRepository { get; }
		ITransportationLocationsRepository TransportationLocationsRepository { get; }
		IUserHistoryRepository UserHistoryRepository { get; }
		IUserAuditRepository UserAuditRepository { get; }
		IAccountsRepository AccountsRepository { get; }
		IUsersRepository UsersRepository { get; }
		void Complete();
	}
}

