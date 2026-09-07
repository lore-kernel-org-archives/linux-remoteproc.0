Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601E143BDB9
	for <linux-remoteproc@vger.kernel.org>; Mon,  7 Sep 2026 22:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788820378; cv=none; b=rsEgJoBpACP6z1k/V0/yotZV+iGJCHI1AObIqoY+qq6XQHjsbn9QRq/fTbWtz3t/DD8TH8142yPXkZ07KV+jdwhLcFHiZxfp/tVhMNYkYn2jC71G8Sl7aWBPjV7OCeTcedRBe/trdkneshPpYTkuWru4E5nGyh7l7qA25dOBBk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788820378; c=relaxed/simple;
	bh=9RNlViBMP5gSfl6YGM7J6Ko4HkVsFl5+nPinarDZvEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=blAdLGw2hXyT6hZXuV6Jem+L3UYt0bMeNCONp7YoTrb27XGeMM362lR61oyptZODAM82KVn5rO3ju1+WR9NJyR1H/YgedT3vrb9X4dBHKYj4S/2a+K0W9+mVQmmYg7CX9ELWyk67FDvS0sJr5oNZwJjyhfglYY96keYNWx7BE0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWm14lAR; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWm14lAR"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495590dde14so57178805e9.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 07 Sep 2026 15:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788820374; x=1789425174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mnujOlryOcOB2B/LvIPxTaLmbwXh/kZV9FXNR3oxSFM=;
        b=UWm14lARKYLQM+ND1gFensmfZyfXbYFhflN8KeZsSjpLigjKDh89DrUCkOrImEbPTF
         JR9nLfnLiSVriZSXzabdDDA6LPWs5IAaAHFEuhGIRkdC7nIPNTT+Gq6t+uqZ3dyoVBj5
         94mHUvmvPGJIPNcHogt1cYmeXsYkoQXixg/RxNUCa9rXuTjz8cr9Z6EhFnsC+71MFl8A
         xdE/vOWoJ1vcWYd5/BsQ4CSoyk5H+1FbJoBzdBmilX5EKX+7Ga8xpjJFqPxELpxUXMXs
         BwllPAFP2eVxdks/aBLXMO4h1e0Gioh6kbwG+YsZwMZZQO8wgyUJCI9S7FxqR/uAnthP
         Wqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788820374; x=1789425174;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mnujOlryOcOB2B/LvIPxTaLmbwXh/kZV9FXNR3oxSFM=;
        b=bEFsakLScil5kOUNuOXNltjnEMKuljwMkAffRrxZa4ndYaglJvuWhATGasYYs/Eq5v
         yqDvvFUcctx5vKVOAVLTJ33tdsoiQYNY6gvFdvkgN0/ajwAVCn0THQchmpzNREkUp/4r
         P/pOCib0lXw98FEQZEI34aGibIdp7srgEw77cRFKReIhuqu3WYvBf/rmfQllWoRGcC1v
         /jTyhzuVCKWU1ZnfihFNB52KtpLm+YEyNy95HHtzeiM3ufoDk+q9c1y4cqGH7+3b/eZo
         l0SGWu3BUBVtX2gnqTrZ1h/8E71ZQ2M+O1bdPp8LOnpF32fN1gS36LR0l+E+bxh9aVoe
         sxew==
X-Forwarded-Encrypted: i=1; AKwUvBye36dE17K6Q2s20HsHYAwfFHRg8LnAcF2TKPtgi3C8yZbmpheZtpVb8VVxxMLbnNUCqynEig4jWz0QbdGrvWQs@vger.kernel.org
X-Gm-Message-State: AFuF++nJHGyt+RrEXOYnylP3N2qckBFckRKEVaA337TyOrMidJG8tS0g
	unqMDA0be2fqrqVI3Qn2iDUwLx62UV71BunouW1tgwaStkvD+LjlzkRE
X-Gm-Gg: AYBFou0sKBS1ZOyDZN8P62Tq4qoB9m1QDfADo6k4zZb3BjqKLFL4F6BSIcPc7PtgXo2
	Nybkyn53Oun1HQKys1oMXLYSyNvpUhcdMzFsTBjb89r9f5JE67KkrRyjQvoURp6pCdIiFE4ssOd
	lftZOi5OrcnXhRHnikBYRzg3/lCgPl9EMluT9Y6elkGTEUhWRFohZs1QPUufMSK+199CDGSG3IT
	StA54KE7abSQ4mVI9SsRI4KE07x9rrAF7w1v0Sor+PfRyk4JtXF2oHRA6yVms5zm0uglCXYZWIx
	0SMxsute9lDMBOOb9hTa71/9nNMqUL2BXHvGERnU0ASYd7oYKvxYIWtlxhux4PpQ7j1fo00m1ck
	cAVgiH7NcZiU558L7BvML82FS6+4Oh6/ySQKHzLmFKEhubNBVkq5f6Cv1hhs/CPsUYxCFoa24xa
	1mcOHX0a9KaUd1xUet5NITav6cqFBLBmGP1dzokuD5yiDzWyfDNDOkvsaR1lFSWE+oiDeFLqHUn
	AE62Xesof7r2eKDgj2Dm3VgDeynoIB7hdgZnAD+JcIR9kDjLSURtwpFfKvBCntwozz5sMumUYSQ
	BFGWX10qHR9yVgSkeFRiwi3miO/4pZGJhydA2RqhNk1GLXNmeEm3kjmjNNuqjTYOmcQmLgzGeHJ
	C
X-Received: by 2002:a05:600c:a0a:b0:49c:e1f1:3dd5 with SMTP id 5b1f17b1804b1-49cf81e6cebmr448618745e9.4.1788820374459;
        Mon, 07 Sep 2026 15:32:54 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-b0c9-3601-cdce-ba4b-d0e3-dede.310.pool.telefonica.de. [2a02:3100:b0c9:3601:cdce:ba4b:d0e3:dede])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce551bf7asm289518525e9.2.2026.09.07.15.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 15:32:53 -0700 (PDT)
Date: Tue, 8 Sep 2026 00:32:47 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowangio@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rusty Russell <rusty@rustcorp.com.au>, 
	Pawel Moll <pawel.moll@arm.com>, Cornelia Huck <cohuck@redhat.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Vadim Pasternak <vadimp@nvidia.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	virtualization@lists.linux.dev, linux-input@vger.kernel.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, linux-um@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] virtio_input: stop callbacks before unregistering
 input device
Message-ID: <ap87JrBAxjbPe_jX@gmail.com>
References: <20260905152059.89560-1-kmehltretter@gmail.com>
 <20260905152059.89560-3-kmehltretter@gmail.com>
 <20260907174559-mutt-send-email-mst@kernel.org>
 <ap82pFlX8enNG0gZ@gmail.com>
 <20260907182153-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907182153-mutt-send-email-mst@kernel.org>

On Mon, Sep 07, 2026 at 06:22:09PM +0100, Michael S. Tsirkin wrote:
> > 
> > "Assisted-by: LLM" is the form Documentation/process/coding-assistants.rst
> > gives now.
> > 
> 
> really? not what i see. in which version?

Since v7.3-rc1. Christian Brauner proposed the change here:

https://lore.kernel.org/r/20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org/

which became commit 816d9992d9ed

Thanks,
Karl
