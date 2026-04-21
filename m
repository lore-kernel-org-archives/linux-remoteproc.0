Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39AD3D75C5
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Apr 2026 13:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776779167; cv=none; b=KZnNfjwBVxZxr2SR9veTetNUVHwjyl+MImqsMTGf8kSZs2pFt8VAwM6Zd8bKCYwtODTVbCdsZ2It+cbiJqPBjZAPK4/N7547p3aoK8yqdpGmx6rXp41S6v+yDW4jTLLeJEVugn0078Mk8q/9nI8CDtY38yPP27Q/AYjpOxhwrjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776779167; c=relaxed/simple;
	bh=KcazhR1FwuJGOUvvuH2Fx0hl/HbIQAv1xGBiU5ejLO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3AMtf52+rj4WM+1N/ahUYjYYE0+93hrHUb5o/txvmoxRRFHC+iWZvpjbS8G40SqkYzgEQRyA4EhAU4kd0j7iFLTPeFHdX+iLT5pGwx/pQPE1ljQ46zckQknKFWO8MIK1tKBZutFma3Kh0cINNfdE94FG1GqDwq7XV2yi3KEgBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ouVuohJk; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ouVuohJk"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so38324725e9.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Apr 2026 06:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776779162; x=1777383962; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PN2+x6/JKFYfRn3NRNCqOpga4ObXC7joWwnqrV4KVkY=;
        b=ouVuohJk30aeWY7QVcfv6SJaSuQgxMjaveheY2DPkhQ5KLNNeNXvjpnUtTKln5Wj6H
         X6cLUkrvZC0sNTGYwKYkpccHDMj0puC+ApK1qzFJnyS9/IlMs5ND0dxtQmRYt2NEmxJs
         v1dnUMFCus/E7W+ytAGxlgkcqulQh0ElIzJkb74kOukuHnuigUDvAyiKWfcolW4QL7Uw
         tO6hssSvw1k/uHbgxzDMsZNDdxohHbgW8M43/w/kjnuzJigWAbiFy1o+jypGfoJNy1Oj
         u33To09w8mSLDYZoAbuZtT84h3M6QrvCgadSTQYG/0I4yCL9KenQUtWHRxKN5/QP1QP8
         +QmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776779162; x=1777383962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PN2+x6/JKFYfRn3NRNCqOpga4ObXC7joWwnqrV4KVkY=;
        b=Do7EWpM/HsBkuGzhDb1JBB+ORybvOh3YpYUyVqfNcN1UNP98g81/PzruDEfQFPna56
         5HNwIbAmck8U4bCnbcaRF0421TV0veqqkjFCe8pkSAn7E7rsCErfdG5d/l03kKo8BOli
         Y+zccO7ApYYXMK4jA0EHh1Y425MxuA1sch4kkrsN34AhwIEsd+Q+oL+O3nu/bWIhWDeA
         p8ozXM0sennwBgVhERMMb0bsXCZ0S31rZldbuE3HXR1dIKa8fvRX5SWAJDTeTBV+MBCF
         Ci8E+Fg+D2WqdwD9Sd0/vSGpt/Y6ZLz4CJAOs/6KtQF9eKn56YZ7tRKc6B92e23ptqxk
         ptIg==
X-Forwarded-Encrypted: i=1; AFNElJ9tLaDlXQ/2qcuzzPNu+SGvlLd/xS+3DOoqIMVA7GKm4mSdDkstYEcpbIAXvWp3IbV1HKvfb1B8pVTuCc1jobPj@vger.kernel.org
X-Gm-Message-State: AOJu0YwtPNOfkYIQshHHnANcCjQ9DCqocUqK3qAFoDo5e6QwJJkQTCQ4
	HRAPABZ+VQ9zJYp1Dk0KLxZCuAKqyLI6ILqDdqPOwtMcRaRNLxXTJ0V22TApHW+IW1M=
X-Gm-Gg: AeBDievfULqZNULQnoQx8IUQhaL/rErIG7F74/8d+uU3CAnyiJOVf9R10IDTasXdZb/
	9mNuhfCexAUvxWYmxomhAte+a+TF4CdH6nsePIB5HSDfkZOL5iXIZ2o101uYyBJGCAtVDE853qc
	bbGVZuww1wIdwfax+aZIKMaK7iVwix218MfBy22nkP9JUz9OLnIklWvqp0f31bjAIddf364lsKM
	ZTP6wtrhM0dy89AHaieL7tUqK98IIRx/C3apUgYHRyOK27OcqoFp5OFa4ty1CpODpBXhrsjHslO
	fb/gOz0VO5bcOyDVIatu73WcFWsAPmNlMNXJEzCkH2VCblUyV6C/dyulmnJh5/W38MMBNQw5xUb
	rfAhVbVsOkKYR4VXo3NHJIRfQZoJJ51IVc43VhyDqIyRiyB/MPaTK3ZD4W02bh2/0/e2xi/2jDJ
	rO89c/NJP9mAsVLMJ+taYeMG/v5Qoi/Jp2etZzcMW5
X-Received: by 2002:a05:600c:890c:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-488fb739cd9mr209881105e9.1.1776779161867;
        Tue, 21 Apr 2026 06:46:01 -0700 (PDT)
Received: from linaro.org ([92.206.190.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891d251b24sm48875415e9.7.2026.04.21.06.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 06:46:01 -0700 (PDT)
Date: Tue, 21 Apr 2026 15:45:51 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: Check glink->edge in
 glink_subdev_stop()
Message-ID: <aed_jyMEuWLlQRDv@linaro.org>
References: <20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com>
 <20260409-rproc-attach-issue-v1-2-088a1c348e7a@oss.qualcomm.com>
 <adkF7EY1KVRNO01o@linaro.org>
 <c6a9936b-9f44-4bea-93a1-17d145e64eec@oss.qualcomm.com>
 <ad36erdhcvnIvFMH@linaro.org>
 <e9720deb-d46c-4556-b69d-1dec00cc7892@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9720deb-d46c-4556-b69d-1dec00cc7892@oss.qualcomm.com>

On Thu, Apr 16, 2026 at 10:52:17AM +0800, Jingyi Wang wrote:
> On 4/14/2026 4:27 PM, Stephan Gerhold wrote:
> > On Tue, Apr 14, 2026 at 11:23:50AM +0800, Jingyi Wang wrote:
> > > On 4/10/2026 10:15 PM, Stephan Gerhold wrote:
> > > > On Thu, Apr 09, 2026 at 01:46:22AM -0700, Jingyi Wang wrote:
> > > > > For rproc that doing attach, glink_subdev_start() is called only when
> > > > > attach successfully. If rproc_report_crash() is called in the attach
> > > > > function, rproc_boot_recovery()->rproc_stop()->glink_subdev_stop() could
> > > > > be called and cause NULL pointer dereference:
> > > > > 
> > > > >    Unable to handle kernel NULL pointer dereference at virtual address 0000000000000300
> > > > >    Mem abort info:
> > > > >    ...
> > > > >    pc : qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem]
> > > > >    lr : glink_subdev_stop+0x1c/0x30 [qcom_common]
> > > > >    ...
> > > > >    Call trace:
> > > > >     qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem] (P)
> > > > >     glink_subdev_stop+0x1c/0x30 [qcom_common]
> > > > >     rproc_stop+0x58/0x17c
> > > > >     rproc_trigger_recovery+0xb0/0x150
> > > > >     rproc_crash_handler_work+0xa4/0xc4
> > > > >     process_scheduled_works+0x18c/0x2d8
> > > > >     worker_thread+0x144/0x280
> > > > >     kthread+0x124/0x138
> > > > >     ret_from_fork+0x10/0x20
> > > > >    Code: a9be7bfd 910003fd a90153f3 aa0003f3 (b9430000)
> > > > >    ---[ end trace 0000000000000000 ]---
> > > > > 
> > > > > Add NULL pointer check in the glink_subdev_stop() to make sure
> > > > > qcom_glink_smem_unregister() will not be called if glink_subdev_start()
> > > > > is not called.
> > > > > 
> > > > 
> > > > You mention the actual root problem here: Why is glink_subdev_stop()
> > > > called if glink_subdev_start() wasn't called?
> > > > 
> > > > The call to rproc_start_subdevices() in __rproc_attach() makes sure that
> > > > all subdevices are in consistent state when exiting the function (either
> > > > prepared+started or stopped+unprepared). Only if all subdevices were
> > > > started successfully, the rproc->state is changed to RPROC_ATTACHED.
> > > > 
> > > > In your case, attaching the rproc failed so the rproc->state should be
> > > > still RPROC_DETACHED. All subdevices should be stopped+unprepared. We
> > > > shouldn't stop/unprepare any subdevices again in this state, they all
> > > > might crash like glink does here.
> > > > 
> > > > We know that subdevices are already stopped+unprepared in RPROC_DETACHED
> > > > state, so I think you just need to skip rproc_stop_subdevices() and
> > > > rproc_unprepare_subdevices() inside rproc_stop() in this case, see diff
> > > > below.
> > > > 
> > > > @@ -1708,8 +1709,9 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
> > > >    	if (!rproc->ops->stop)
> > > >    		return -EINVAL;
> > > > -	/* Stop any subdevices for the remote processor */
> > > > -	rproc_stop_subdevices(rproc, crashed);
> > > > +	/* Stop any subdevices for the remote processor if it was attached */
> > > > +	if (rproc->state != RPROC_DETACHED)
> > > > +		rproc_stop_subdevices(rproc, crashed);
> > > >    	/* the installed resource table is no longer accessible */
> > > >    	ret = rproc_reset_rsc_table_on_stop(rproc);
> > > > @@ -1726,7 +1728,8 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
> > > >    		return ret;
> > > >    	}
> > > > -	rproc_unprepare_subdevices(rproc);
> > > > +	if (rproc->state != RPROC_DETACHED)
> > > > +		rproc_unprepare_subdevices(rproc);
> > > >    	rproc->state = RPROC_OFFLINE;
> > > 
> > > In this case, rproc_crash_handler_work()->rproc_trigger_recovery()->
> > > rproc_boot_recovery()->rproc_stop()->glink_subdev_stop() is called,
> > > "rproc->state = RPROC_CRASHED" is set in the rproc_crash_handler_work
> > > before rproc_boot_recovery is called, so checking RPROC_DETACHED can
> > > not work for this case.
> > > 
> > 
> > You're right, I forgot about that. I think we need a more generic
> > solution for this though. rproc_stop_subdevices() should not be called
> > without a prior call to rproc_start_subdevices().
> > 
> > I think there are a couple of options for this:
> > 
> >   - Add a bool "subdevs_started" to struct rproc and manage that
> >     separately from the rproc->state.
> > 
> >   - Track the rproc state before the crash separately (something like
> >     rproc->state_before_crash) and check that in the stop path.
> > 
> >   - Add a new state RPROC_CRASHED_DETACHED to make sure the states are
> >     unique.
> > 
> >   - ...
> > 
> 
> Sure, I think a bool like subdevs_started will be better for maintain?
> 
> > Does the same issue also exist in qcom_pas_stop() of "[PATCH v5 4/5]
> > remoteproc: qcom: pas: Add late attach support for subsystems" [1]?
> > There you check for pas->rproc->state != RPROC_ATTACHED, wouldn't this
> > also fail for the RPROC_CRASHED case?
> > 
> 
> I tested calling rproc_report_crash directly during qcom_pas_attach but
> did not see issue, handover_issued is set only if attach is success
> so "handover = qcom_q6v5_unprepare(&pas->q6v5);" will return false and
> "qcom_pas_handover(&pas->q6v5);" will not be called.
> 

Hm, as you mention, if you call rproc_report_crash() during
qcom_pas_attach() then handover_issued does not get set (so it's still
set to false). But qcom_q6v5_unprepare() returns !q6v5->handover_issued
(handover_issued negated), so !false -> true. So I think exactly the
opposite will happen and qcom_pas_handover(&pas->q6v5); will get called?
It should not be called in that case, because this will break the
reference counting for the regulator/clock resources.

In addition, even the disable_irq(q6v5->handover_irq); inside
qcom_q6v5_unprepare() is problematic. enable_irq()/disable_irq() are
also reference-counted, so disable_irq() should not be called without a
prior enable_irq() or you end up having the IRQ permanently disabled.
See e.g. commit 110be46f5afe2 ("remoteproc: qcom: q6v5: Avoid disabling
handover IRQ twice").

Thanks,
Stephan
