Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BEB423A6C
	for <linux-remoteproc@vger.kernel.org>; Mon,  7 Sep 2026 21:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788816204; cv=none; b=AYMNkn6Un3lA/UkDawXauGNvQcdtSqW8+cVq9sAcJA26X+3EChcq32zdYD0Hdh0VnzgvxIpWb3h4P9CAy9GkNn7Lx07o56FhZXdkccr46Tj2TZtJVPsJ6n3K0Gffw+n7aXQZ6iy9eEpgT7/uUsUt9oKayHR7mSh7UcylLNfQWnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788816204; c=relaxed/simple;
	bh=Gzcz3Zkq6mIgF9nN+/RZpdn2G6QVcg2SErOL9iM3Lwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/cTtrO03d/LeH8Hx1Ums9GxXjKlsQDKvuhQHFLUm17YH8Z7nOuKUE9UGcc+wjjZCVSKqofKje1NjuSNn63yTTGZLonleZrMPHHjtYjcjC+p+IuuIfBAdzGkSVKtNCGUAF8RY1Q00ct1bswdmW1CJopSyowHsQ7MfEldc+1PLQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dB90dpFH; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dB90dpFH"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47fe89fb333so2548981f8f.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 07 Sep 2026 14:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788816201; x=1789421001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zj4alWZ0+Z5ViHZ+ZCYKHStoDMFk30/0JNVi4/sJSpo=;
        b=dB90dpFHKckqTrmJjkDD5EUcDaUVt1xE4+JqKWmDR3ffIvrgUgRi0TAZJOpGZIijr3
         r/gJhz7hTnDw0qeQtUWHPCJyMvEL5GJYheAVws5eMPQ+/xr0LhAuuMOsXifE3Ev3aN7p
         yr25BWL5Y0XVgpuO5hLdUZU7udToKuVTxl0DxeCYuTOPpeqADHaqXa4AOQLR1GKxqPPE
         mIaJEwlUqTmTEvBkpxsc/uOL8JUdoFiMsBzIKmjG2zLo2S04A396WnRs+D19swYmLDHr
         s9E/nQut36rJRvxtRVcaoXwRTSnjMNWeIQYjAE5zGTXq2mGfq/awfBiz04y+azvUSlL3
         Siag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788816201; x=1789421001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zj4alWZ0+Z5ViHZ+ZCYKHStoDMFk30/0JNVi4/sJSpo=;
        b=YOPNtnHHaPr0Qophec6vzdk8DdUQqN3Nh9TPW2iumhdTiYaiPlIkSzFcjYc1euNAXL
         xC8DvvJnLrCFSkKnVRDwo8WUrSuRUgpRh+onNRfJoX/qmPuMWlNSvkahgHLM2jaYiGGe
         rsRcWkMjdrxD/w1eIS8GLwi5t+DwRHC2p6YDPT07gJJDY9fknmaKxeCByTwHNd92PKMI
         tf/R0bhYddZbTID5gNO8nL8pHPtPjcbvwhTxAXoRyh3qgenggk0OfIOUK45NA0nxJocG
         TuniBs058udjIR/X/xYzRbAJNBmS2FJkoBVUUOGYD4lyAegt7zWksPAeuAKFzqcH+xr9
         mR7A==
X-Forwarded-Encrypted: i=1; AKwUvBxc7vk0eBaVzfKgewrzTPd9GYKSlMv+6wzLrXtD2Yf189vgYIw0jzD2xqKYC5K+9NoOX+QcGWUzz+kir/zsc357@vger.kernel.org
X-Gm-Message-State: AFuF++l2T/s/VhNonDjdW+zTKy6m9mIWmFgi1gpjgvW7UkhfEiDHkikL
	x0D1aLdb/AfkUfTxV4fWFOPmaYOzjtO7psf/THCETCbeHMDojczCNiSk
X-Gm-Gg: AYBFou3M+Z0DpS0URn7eImKE9flH3gYvPakJ6BqXCA7Vcob9DcAiZOzMrcnfmNxs8dj
	fr/RIwsoud/uj7YNMEK9Up9Y5v7eMz4wW6RbhbJiIBwWPk++pyJQDBdJC920qJhtICvgXiFKvMz
	tS2hLopDPJW6ruLasIZx1cg7gHWDTjAdk3G6Pk38iMzWu2HHDLOtYW38AaGvHybh0NuY9S4lPcY
	ws/9sgLEx0hwz8xJmEIFPIKGVMZqk7lZV+9zUlDDrLdBJKwQMvdlWrZ94sAIctbvjN2BWzg8NQQ
	YEIzGZwonOtxZQSckp9IdHx6aJ3Pjbyr4ioMjbB49gBlAwOl5Oxww3pvNp6oWQOysYEzhVsChhC
	lWCtLl/rYhBwj4//K5Dgb1+34fDkvrpnvjOQrpFv6QFnwlahNFeZldcmOMsCgEnNyXX30Esf9DW
	UUogsMpIKQaRMjCb5pYpTeebKs86kDR7h7GRKAh6E5mRx6VePMEiQWPqNM3c5BzQWbWXC/ode+2
	M4m4DpqQhaxPgi8Wdf2TzRzQA6Y1UJni9D5C/7h7FJWO5S7u/lFSklnrzaBGxdGEnXDOsu7jf1z
	3SqmmCeZvsxVa8Oj6g6zwUmb3mv3q40b7awTxNlg3LcS7hvZRWAik3Neqnx9RvWq1V8kpf5Ho7m
	it8leKgU3q4c=
X-Received: by 2002:a05:6000:4a0a:b0:484:3310:f39b with SMTP id ffacd0b85a97d-485872e05f9mr26354952f8f.28.1788816201067;
        Mon, 07 Sep 2026 14:23:21 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-b0c9-3601-cdce-ba4b-d0e3-dede.310.pool.telefonica.de. [2a02:3100:b0c9:3601:cdce:ba4b:d0e3:dede])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm29964718f8f.16.2026.09.07.14.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:23:20 -0700 (PDT)
Date: Mon, 7 Sep 2026 23:23:19 +0200
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
Subject: Re: [PATCH v2 0/3] virtio: synchronize callbacks during device reset
Message-ID: <ap8rCQII9fASEosZ@gmail.com>
References: <20260905152059.89560-1-kmehltretter@gmail.com>
 <20260907091033-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907091033-mutt-send-email-mst@kernel.org>

On Mon, Sep 07, 2026 at 09:13:28AM +0100, Michael S. Tsirkin wrote:
> got all 3 patches now. it's a good start, thanks, but they need
> a bit more work, in particular addressing sashiko comments.
> I'd also prefer patch 1 to be split: moving code from pci to core
> is separate from ccw fixes.
> 
> Pls write or at least edit commit log messages yourself,
> after reviewing Documentation/process/coding-assistants.rst
> 

Thank you for the review and feedback. I'll work on a v2 now.

Karl
