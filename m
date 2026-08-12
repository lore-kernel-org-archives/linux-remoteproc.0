Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2369314D1A
	for <linux-remoteproc@vger.kernel.org>; Wed, 12 Aug 2026 13:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786542744; cv=none; b=DUyEdJwwITc6oX3OR9FsxfjOwbYXGf+zs8Ot3GdTSBZLdX+9/MF2wG8ImgbH5pg9EwUbxX+95nvu6SQF7OPddD1Wt8vAIpBouDSqkiUrPMagNxb9n61i2sM0Y5b2D2OQg0CA5oXti+IVzhQGgZcyNlyVNBGK4TWDYTV7wOJ3ehw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786542744; c=relaxed/simple;
	bh=PHBT04mGKKjeGR8nrveAtUhDPUiQhaCXsbl8UPeIBZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZkwnvvDdMRXmxKaSlLak3ERcbUNK96bUtDk4n6hJVhIH+jHW+EPBV3mz4V2m3HSmhX/Qy+FCz+YaP41rStpfXnruScsjfG5H2kA6cpfM5XPKaaJcz1RTr/VXoPl/D+mr8gbry/tD96cQx4fkZybvNqdV1BS5/nvhZZt305Fkwjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o1KTUP1d; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o1KTUP1d"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a378f90555so807426a12.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 12 Aug 2026 06:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786542741; x=1787147541; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/fTsa1qkfd0K0e+Ute2IySqdFNsKnt3IMAwlJjOorbM=;
        b=o1KTUP1dEqouWvl9KWyhSzVfduumOMoJA2MMPpbkYkOMKAtx+sP1cCd50XJhD9R8OM
         RW8MXihZCHdrdQGDc7mFNPwxExK64xKUuGtcS+rVP510BVLlGwE4I/p+xUH19sCAJywP
         2ALLGsXPXEy3kzCY2TbLv4W8Yu5dcJtQK6Pfl5ngfm8ljTrQ7WlLxWg7xKn4NmZefNZa
         v8MA0oBPLUYBCWoT7MMglAH0HddmS3DHqsu8Di3iuLW511ONaupzANYSUNY2R5VxAPY4
         XGxYbWZuUZfH/drswdhNLntGoU6eHqxCW6g/yfJ1EFXglnhDZwuK/7oEbE4Fk2lKZ5St
         I2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786542741; x=1787147541;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/fTsa1qkfd0K0e+Ute2IySqdFNsKnt3IMAwlJjOorbM=;
        b=dZk/fbmu7t1E1jnHKYzwVU2P027xKwL2mMIyWZahJDEfq5O/hI/PctGkWCGvRti0eM
         NDmWKKjpJPB6icsITd1Auutm8Or8TGk+4HHwiux973MOKQiYQf5nUYj9xafMPv3evarq
         lA1bpVctb6wh22ztQZdEY1RQ1zfd+Lh+cS8ZM5WEKOZy1Znf+owysCh+hR2sRYe1aaIN
         gk/vs3LSOcNWE/h3sHbLHF0AFnemZWlGlQyU9K7L6BETmgqSdfsDuazviVK90vXg2bXa
         hY0fT+f78AQNiSLyaOb1um/KE3srwdpmb7xbVtvmgDBqm9XqeALX46OgSd2o5Sb9Ho/O
         LhPg==
X-Forwarded-Encrypted: i=1; AHgh+RofcViY65H5yE+NJkbsIaXwHruVPaJjD1bDEe3SnuiMfexmERhx11ObgkRS2IwywzL7fTKyHVIRB2mG+grxOqrg@vger.kernel.org
X-Gm-Message-State: AOJu0YybJFyjFjB0vY2nVE92Y+vt1BXk6JqwKERW16NTHwBeXPqhqlrK
	pVpnDQn/NlRRbPM69sp3RDgOKzohBEa9YHW915BgZ15iZ72tn5XT62Mt3e7cqndd7dY=
X-Gm-Gg: AR+sD10gmKdZervVzr8JKN+2TufpZdOLNJ+7X97Xy2qb3DodFUrpSYx78CW9wXdfzoi
	k3Fh1xYX8uDc3ZhR/2qsBEUzAxPCH7hedUMplVx8ZXk+sXqHgWouYnicXq8D3wKYe/fnvfGhuLW
	Xobemm67AfFhIBFi9AFSlhtr87AvSi+U6qSt/zb+lFMFYwTp0sRe1w1jpfw9ur0YDtjpSLvSHeq
	yIkn694iZjgNqK6+HxjX/wQSFnxGpHDAWD/1Uzob8/2mvrE65ByVRsVKPz1GqrLuerepPhrnm6Z
	CKSslqVLUCAb8mxgDghLCVkXJX/wkjc2ZG4auyhlhsyjSCTpA63fxQEMu/JoXBc+91snRCFjaLP
	OX4ejt5s+8CFs02jWWEj0eCOZ0Ii+Itlba/osTzhhzoPWFIhhnAEg0aJcr+evV/uw8JinRGcjJ0
	7WoIoXWL1iAZYo8d24Xy9rYI8O98WWdCZ3FLERvR63pjTsd/rhKav42csJFRIwtnsbDok/fQjw
X-Received: by 2002:a05:6402:4550:b0:699:6d24:e298 with SMTP id 4fb4d7f45d1cf-6a375ecebc2mr1951699a12.8.1786542740863;
        Wed, 12 Aug 2026 06:52:20 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:6efe:f7a0:ed4d:b04e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3768b989fsm757793a12.10.2026.08.12.06.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 06:52:20 -0700 (PDT)
Date: Wed, 12 Aug 2026 15:52:15 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: =?iso-8859-1?Q?Fran=E7ois?= Roux <info@humanlearning.ch>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [BUG] qcom_q6v5_pas: NULL deref in recovery when using
 attach-only ops (qcom,broken-reset)
Message-ID: <anx6j8UX3BzvZ7JN@linaro.org>
References: <20260811171546.188660-1-info@humanlearning.ch>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260811171546.188660-1-info@humanlearning.ch>

On Tue, Aug 11, 2026 at 07:15:46PM +0200, François Roux wrote:
> Running your remoteproc "attach" series on a Surface Pro 12in (X1P42100) at
> EL2, I hit a kernel oops when the CDSP crashed on its own during a long
> build. I was not trying to break anything -- this was a 28-minute kernel
> compile as a stability test, and the DSP failed unprompted.
> 
> Reproducer: any remoteproc using qcom_pas_ops_no_reset (i.e. a node with
> qcom,broken-reset) that crashes at runtime. No user action needed.
> 

Thanks for the report. Please note that this is a non-upstream change,
so while I appreciate the report we should not ping the upstream
maintainers about it. They have likely never seen the change.

> What happens
> ============
> 
> 	qcom_q6v5_pas 32300000.remoteproc: fatal error received: sleep_statsi.c:537:
> 	remoteproc remoteproc1: crash detected in cdsp: type fatal error
> 	remoteproc remoteproc1: handling crash #1 in cdsp
> 	remoteproc remoteproc1: recovering cdsp
> 	remoteproc remoteproc1: stopped remote processor cdsp
> 	Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> 	Mem abort info:
> 	  ESR = 0x0000000086000004
> 	  EC = 0x21: IABT (current EL), IL = 32 bits
> 	  FSC = 0x04: level 0 translation fault
> 	Internal error: Oops: 0000000086000004 [#1]  SMP
> 	CPU: 3 UID: 0 PID: 82168 Comm: kworker/u34:5 Not tainted 7.1.0-next-20260626 #10
> 	Hardware name: Microsoft Corporation Surface Pro 12in 1st Ed with Snapdragon
> 	Workqueue: rproc_recovery_wq rproc_crash_handler_work
> 	pc : 0x0
> 	lr : rproc_start+0xc0/0x164
> 	Call trace:
> 	 rproc_trigger_recovery+0x148/0x164
> 	 rproc_crash_handler_work+0xb4/0xb8
> 	 process_one_work+0x15c/0x29c
> 	 worker_thread+0x18c/0x2e0
> 	 kthread+0x11c/0x13c
> 	 ret_from_fork+0x10/0x20
> 
> Analysis
> ========
> 
> The link register points at rproc_start+0xc0, and the instruction before it
> is the indirect call:
> 
> 	rproc_start+0xbc:  ldr x1, [x0, #16]   <- rproc->ops->start
> 	                   blr x1              <- x1 == NULL
> 
> which is remoteproc_core.c:1292:
> 
> 	ret = rproc->ops->start(rproc);
> 
> rproc_start() calls ops->start unconditionally, and qcom_pas_ops_no_reset
> does not provide one:
> 
> 	static const struct rproc_ops qcom_pas_ops_no_reset = {
> 		.attach    = qcom_pas_attach,
> 		.da_to_va  = qcom_pas_da_to_va,
> 		.stop      = qcom_pas_stop,
> 		.panic     = qcom_pas_panic,
> 	};
> 
> The reason that path is reached at all is the branch in
> rproc_trigger_recovery():
> 
> 	if (rproc_has_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY))
> 		ret = rproc_attach_recovery(rproc);
> 	else
> 		ret = rproc_boot_recovery(rproc);
> 
> qcom_q6v5_pas.c never calls rproc_set_feature(..., RPROC_FEAT_ATTACH_ON_RECOVERY)
> -- in this tree only imx_rproc.c does. So an attach-only remoteproc takes the
> boot path on recovery, which tries to load firmware and start it, neither of
> which it can do.
> 
> Suggested direction (untested)
> ==============================
> 
> Setting RPROC_FEAT_ATTACH_ON_RECOVERY when qcom_pas_ops_no_reset is selected
> looks like the natural fix, so recovery goes through rproc_attach_recovery().
> Note that path calls __rproc_detach() first, and .detach is also absent from
> qcom_pas_ops_no_reset -- but __rproc_detach() does check for it and returns
> an error rather than dereferencing NULL, so the failure would at least be
> graceful.
> 

We can't recover the remoteproc in this case, because we don't know how
to restart it. Attaching a crashed remoteproc (that is no longer
functional) does not make sense either.

I think we should set rproc->recovery_disabled = true to fix this.
Practically speaking though, the whole qcom,broken-reset approach is
kind of controversial and I'm not sure yet if I will ever post it
upstream in the current state.

Thanks,
Stephan
