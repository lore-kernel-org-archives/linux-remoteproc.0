Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D4C171E6E;
	Fri, 25 Oct 2024 15:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729870797; cv=none; b=FcYkduw7PWxWKE5Dhgt53EGu8ao8onFgKHz96MSg9juoC5deJ77kST7SHO3v7asP37NlKNXr/yeCR6y6uMUI25AdxKkAfHauvJ76iv/TN+Tmv+ANa7ajzm8sVAR09x1lZkEDfMx5FPI2cKh0rOJ3L012PEMHlOobvUDKBXpn11k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729870797; c=relaxed/simple;
	bh=LsJXTqLVkHQ9hAVjrw+K74ltuB9T9cJoYpfYxMcCr1A=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uaGugDp3ReIWkRziW78mM7rugKjggbEMFZteR3lbsZOhrpnRZBBZzbM/PSKDMrXOmHVJwU6HZtJ4PTuVxP+K2oRVrNASeOxMtnSND3rUg2uwbhdtH/NJx2EAOSIn0foACCOgYnxItg5DntovV9i7QWjC2Xvwnr47S7SssEuqR+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WieN2nag; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WieN2nag"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PAG8nt007791;
	Fri, 25 Oct 2024 15:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uLjNDzU6iRNhbMiyZv4Vn01G
	ZCkWjxHmT62Xz6ZSK7g=; b=WieN2nagk897qPiojJHOVjwYAG05M1Y06GWydaKq
	G5EKtPLC162PNeyRi+yY18jUpJc5P7Exrtsyr/38qMthD13xqZKBrOcvSnrkmqU5
	QpVQjVigoQrv3FfwRqlt1fN/Q2ORTyUSeKj0vmNsgroGiAJcfaOTuCN57hHr+vYq
	HSxel8F8mBRDMUWO1gCadEH2OKfehjPN9G0t6ODGlBsJFXJEctfD0lk38L5doSjt
	IXTk4QsA1D1+cSEGOaa69hu9hb4pk/DJswVTCj5LhqNU/dX7ar8A5EFaJQPM1grO
	z/0ItdVT9dEmsWk+iBM8oRXUqYp/N79Cab35bWccDLDWag==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42fk52mkjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 15:39:50 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PFdmRu017670
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 15:39:48 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 25 Oct 2024 08:39:47 -0700
Date: Fri, 25 Oct 2024 21:09:43 +0530
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] remoteproc: Add a new remoteproc state RPROC_DEFUNCT
Message-ID: <Zxu7vysFurl6SItU@hu-mojha-hyd.qualcomm.com>
References: <20241016045546.2613436-1-quic_mojha@quicinc.com>
 <ZxZvbz9C/eHzosFN@p14s>
 <ZxtShfshsuyVzGx3@hu-mojha-hyd.qualcomm.com>
 <Zxu0U9U+BvTo20Zq@p14s>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zxu0U9U+BvTo20Zq@p14s>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: D0AtpYxhkBSluSmdJH_EBnnnP7c7meGU
X-Proofpoint-ORIG-GUID: D0AtpYxhkBSluSmdJH_EBnnnP7c7meGU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250122

On Fri, Oct 25, 2024 at 09:08:03AM -0600, Mathieu Poirier wrote:
> On Fri, Oct 25, 2024 at 01:40:45PM +0530, Mukesh Ojha wrote:
> > On Mon, Oct 21, 2024 at 09:12:47AM -0600, Mathieu Poirier wrote:
> > > Hi Mukesh,
> > > 
> > > On Wed, Oct 16, 2024 at 10:25:46AM +0530, Mukesh Ojha wrote:
> > > > Multiple call to glink_subdev_stop() for the same remoteproc can happen
> > > > if rproc_stop() fails from Process-A that leaves the rproc state to
> > > > RPROC_CRASHED state later a call to recovery_store from user space in
> > > > Process B triggers rproc_trigger_recovery() of the same remoteproc to
> > > > recover it results in NULL pointer dereference issue in
> > > > qcom_glink_smem_unregister().
> > > > 
> > > > There is other side to this issue if we want to fix this via adding a
> > > > NULL check on glink->edge which does not guarantees that the remoteproc
> > > > will recover in second call from Process B as it has failed in the first
> > > > Process A during SMC shutdown call and may again fail at the same call
> > > > and rproc can not recover for such case.
> > > > 
> > > > Add a new rproc state RPROC_DEFUNCT i.e., non recoverable state of
> > > > remoteproc and the only way to recover from it via system restart.
> > > > 
> > > > 	Process-A                			Process-B
> > > > 
> > > >   fatal error interrupt happens
> > > > 
> > > >   rproc_crash_handler_work()
> > > >     mutex_lock_interruptible(&rproc->lock);
> > > >     ...
> > > > 
> > > >        rproc->state = RPROC_CRASHED;
> > > >     ...
> > > >     mutex_unlock(&rproc->lock);
> > > > 
> > > >     rproc_trigger_recovery()
> > > >      mutex_lock_interruptible(&rproc->lock);
> > > > 
> > > >       adsp_stop()
> > > >       qcom_q6v5_pas 20c00000.remoteproc: failed to shutdown: -22
> > > >       remoteproc remoteproc3: can't stop rproc: -22
> > > >      mutex_unlock(&rproc->lock);
> > > 
> > > Ok, that can happen.
> > > 
> > > > 
> > > > 						echo enabled > /sys/class/remoteproc/remoteprocX/recovery
> > > > 						recovery_store()
> > > > 						 rproc_trigger_recovery()
> > > > 						  mutex_lock_interruptible(&rproc->lock);
> > > > 						   rproc_stop()
> > > > 						    glink_subdev_stop()
> > > > 						      qcom_glink_smem_unregister() ==|
> > > >                                                                                      |
> > > >                                                                                      V
> > > 
> > > I am missing some information here but I will _assume_ this is caused by
> > > glink->edge being set to NULL [1] when glink_subdev_stop() is first called by
> > > process A.  Instead of adding a new state to the core I think a better idea
> > > would be to add a check for a NULL value on @smem in
> > > qcom_glink_smem_unregister().  This is a problem that should be fixed in the
> > > driver rather than the core.
> > > 
> > > [1]. https://elixir.bootlin.com/linux/v6.12-rc4/source/drivers/remoteproc/qcom_common.c#L213
> > 
> > 
> > I did the same here [1] but after discussion with Bjorn, realized that
> > remoteproc might not even recover and may fail in the second attempt as
> > well and only way is reboot of the machine.
> 
> Whether in RPROC_CRASHED or RPROC_DEFUNCT state, the end result is the same -
> manual intervention is needed.  I don't see why another state needs to be added.

Is it really true ? As when recovery is disabled and any rproc crash
will result in RPROC_CRASHED state, while recovery enablement can
recover the rproc back to ONLINE while if rproc recovery is not
successful it can be put into RPROC_DEFUNCT state.

-Mukesh

> 
> > 
> > [1]
> > https://lore.kernel.org/lkml/20240925103351.1628788-1-quic_mojha@quicinc.com/
> > 
> > > 
> > > > 						      Unable to handle kernel NULL pointer dereference
> > > >                                                                 at virtual address 0000000000000358
> > > > 
> > > > Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> > > > ---
> > > > Changes in v3:
> > > >  - Fix kernel test reported error.
> > > > 
> > > > Changes in v2:
> > > >  - Removed NULL pointer check instead added a new state to signify
> > > >    non-recoverable state of remoteproc.
> > > > 
> > > >  drivers/remoteproc/remoteproc_core.c  | 3 ++-
> > > >  drivers/remoteproc/remoteproc_sysfs.c | 1 +
> > > >  include/linux/remoteproc.h            | 5 ++++-
> > > >  3 files changed, 7 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > > index f276956f2c5c..c4e14503b971 100644
> > > > --- a/drivers/remoteproc/remoteproc_core.c
> > > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > > @@ -1727,6 +1727,7 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
> > > >  	/* power off the remote processor */
> > > >  	ret = rproc->ops->stop(rproc);
> > > >  	if (ret) {
> > > > +		rproc->state = RPROC_DEFUNCT;
> > > >  		dev_err(dev, "can't stop rproc: %d\n", ret);
> > > >  		return ret;
> > > >  	}
> > > > @@ -1839,7 +1840,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
> > > >  		return ret;
> > > >  
> > > >  	/* State could have changed before we got the mutex */
> > > > -	if (rproc->state != RPROC_CRASHED)
> > > > +	if (rproc->state == RPROC_DEFUNCT || rproc->state != RPROC_CRASHED)
> > > >  		goto unlock_mutex;
> > > 
> > > The problem is that rproc_trigger_recovery() an only be called once for a
> > > remoteproc, something that modifies the state machine and may introduce backward
> > > compatibility issues for other remote processor implementations.
> > > 
> > 
> > I missed one more point to add here which i tried to highlight in second
> > version[2] that setting of RPROC_DEFUNCT should happen for this case
> > from vendor remoteproc driver and not at the core and that should take
> > care of the backward compatibility.
> > 
> > [2]
> > https://lore.kernel.org/lkml/Zw2CAbMozI8vu4SL@hu-mojha-hyd.qualcomm.com/
> > 
> > -Mukesh
> > 
> > > Thanks,
> > > Mathieu
> > > 
> > > >  
> > > >  	dev_err(dev, "recovering %s\n", rproc->name);
> > > > diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> > > > index 138e752c5e4e..5f722b4576b2 100644
> > > > --- a/drivers/remoteproc/remoteproc_sysfs.c
> > > > +++ b/drivers/remoteproc/remoteproc_sysfs.c
> > > > @@ -171,6 +171,7 @@ static const char * const rproc_state_string[] = {
> > > >  	[RPROC_DELETED]		= "deleted",
> > > >  	[RPROC_ATTACHED]	= "attached",
> > > >  	[RPROC_DETACHED]	= "detached",
> > > > +	[RPROC_DEFUNCT]		= "defunct",
> > > >  	[RPROC_LAST]		= "invalid",
> > > >  };
> > > >  
> > > > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > > > index b4795698d8c2..3e4ba06c6a9a 100644
> > > > --- a/include/linux/remoteproc.h
> > > > +++ b/include/linux/remoteproc.h
> > > > @@ -417,6 +417,8 @@ struct rproc_ops {
> > > >   *			has attached to it
> > > >   * @RPROC_DETACHED:	device has been booted by another entity and waiting
> > > >   *			for the core to attach to it
> > > > + * @RPROC_DEFUNCT:	device neither crashed nor responding to any of the
> > > > + * 			requests and can only recover on system restart.
> > > >   * @RPROC_LAST:		just keep this one at the end
> > > >   *
> > > >   * Please note that the values of these states are used as indices
> > > > @@ -433,7 +435,8 @@ enum rproc_state {
> > > >  	RPROC_DELETED	= 4,
> > > >  	RPROC_ATTACHED	= 5,
> > > >  	RPROC_DETACHED	= 6,
> > > > -	RPROC_LAST	= 7,
> > > > +	RPROC_DEFUNCT	= 7,
> > > > +	RPROC_LAST	= 8,
> > > >  };
> > > >  
> > > >  /**
> > > > -- 
> > > > 2.34.1
> > > > 
