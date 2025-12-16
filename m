Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB778336EF0
	for <linux-remoteproc@vger.kernel.org>; Tue, 16 Dec 2025 21:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765921653; cv=none; b=Covt9H+4punv0GkNs1GvSvMUInbGc+7VNby/3eMxrWD2vrVlu4B5xPywFsKSDUVw1JdGgXwM6UQNMlw8HlO0juNSZ2OWFTAqEIg/71lJccn1Gx7ZeFQcONBQyXucxHOLB14+JTWFrX3XKiSRAXpGFaUjQPl6FWuzOatTepOmsnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765921653; c=relaxed/simple;
	bh=zPaz9NwIu5LqjkZDRTDwXcYKHvfqR8LB/rflK2/c8IY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B2utJP7vH2Mw0yc9UQqCrjUZrAOBPPrObcMwA4gVKbJvqE/9gKL2VnHuzbpgEQTsEBFrYQF3B8n3iJWe3Ey1LJYV5GhUTN0ECu46dSZ+8IKljDlCJka46rjm/DLFs+2NVvVPiuVj8pOCTAkIkO/6499xKWV2WABqhdzXp8EDIrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GBJdR2kd; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GBJdR2kd"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a07fac8aa1so38988555ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 Dec 2025 13:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765921647; x=1766526447; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Y3BFOvu4qnjOy9S+M7XwqzXQvDW+Ax1Y2TYztKzcxw=;
        b=GBJdR2kdOFMEvY0hJgFC05qrdKy32JtG5Soiqiyhn69jcQBun0wYyu9MLQ9qvd0x6S
         /5N5wVBq/VlXQ4KlN6zn310FhRJWHsrH/rhxX9or3x4rfy4+Pj07ujJAhmGxS6BsngEr
         LcbKXG7GHac8ThuVNkGoZfh3o/RJx/Ng7yeJiu4rZRsNtgta/2sdCuciP781ibRhRTdw
         7w2Ve+yf2cOJGV8pTf2FOi2gSIbYfkzBHgKvBTokQZ07AfY6nGEyUkdEoN+j0JzxN4rb
         SUxDAA8+OUl9RaobdRiJIC63BVMu2tBBBtVjWdqDC+OFCyPdyKqLhDrc9OfnlJVnL/wU
         IJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765921647; x=1766526447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Y3BFOvu4qnjOy9S+M7XwqzXQvDW+Ax1Y2TYztKzcxw=;
        b=rcfo6rkdicYKxhNHSHcCtBgJdCKKzMYmkZhABoNgDp9gNOfbgMh+ICvtkRLndkJY88
         b/ZFTB5RMwwHTEUjzQQoCdVdC/+DX2ZgrBDJOn0tL/Mj/dYOTY6k142wQpi2sn/+IzsF
         p/djUTyO2tW2YzUD6yz3d5vQk8YaYBMyZQZUrYkBNz9TEY7ZFwcu1j8CRHQPhPY3K7wN
         MNhWubuX7emKIrg10xrT5oIBm1AO5hS5pf6rZHe95n2ukuphnDjnVqxv4Lw4FNNBo0OI
         ibkkZaoBGZSfrjKJ2K0ZxixW0aT1xhHQ6tTaklJdL8Y2xgoaz/Lb1YIwPd/BKWdPxd7M
         Vj7g==
X-Forwarded-Encrypted: i=1; AJvYcCXN3qxEPwUQoyPbLQk1SCsD3Y4+MY8FmfmDsv7jbIt0nZEZ7EWrfcrYz08iJicutQrOd87icNUzFx6ahsmHgQWK@vger.kernel.org
X-Gm-Message-State: AOJu0Ywybn7W+LiwbWUK4PaFnopBglu/sTP5LnUjjZOB6rv7bAc+ZdE3
	7pCGZUBREFuc0+24nNZSh6KmsTWt+osLIlYqR70OqNBw1tTblWRNiAZuNZAbrhP2v3cpCwS/kEx
	IMO95aPY=
X-Gm-Gg: AY/fxX65HzYqNMeYz92fmQcgTvW7RRtazHlxsdBicZUpXUB6QJ2uAsQ33PuCp9ukmiP
	lXXszFk7uNOIrbGudufg0Pv/WU09B8ek3nIptl4bNVe7t6tyn7OzLpuIJgVbN0QWLog0XNv/DsP
	mCQWPKs84aHDk+AEejQdLtjhnjhDFv1E8YKIUNl1htiYjgY8pGbN6eXJNoqB4NAVlCGQ1ir54qj
	UtVmB8icZIi72+W5b3H/te0fMu9JmAbrQBIBodhlT12p93uL8uwSEOxD0vQu/RLJrbUKbRyG/Mk
	1B44k4kV7bwRC6eykWg57KS4sPJdW7gZIvitXctY2FeoSxqwJS6SFH/j+vfJDM/xIYoMau9kUVx
	vJR9fRDmGWXD2ZqfKg7RT2AX72ygxnSjEdikjZql+2z7Dbb0z0j5nVDFJledJthQ6TcWL8x3ZEZ
	lDWmsAC+oDerOR3A==
X-Google-Smtp-Source: AGHT+IH+is0jzTxGbCXW/LkgldELkeFIBkKIDXZg2K2s15kItSVOKpY82H5bs6M7ao21J27W7LRMlQ==
X-Received: by 2002:a17:902:f64c:b0:2a0:ccef:a5d3 with SMTP id d9443c01a7336-2a0ccefa696mr100801935ad.3.1765921647018;
        Tue, 16 Dec 2025 13:47:27 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:ba5d:91e2:900a:fb01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29f0b6f7d0fsm153936765ad.64.2025.12.16.13.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 13:47:26 -0800 (PST)
Date: Tue, 16 Dec 2025 14:47:24 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Stefan Roese <stefan.roese@mailbox.org>
Cc: Tanmay Shah <tanmay.shah@amd.com>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [v3 PATCH] remoteproc: xlnx: Use high-prio workqueue instead of
 system wq
Message-ID: <aUHTbCVdG6i1hA8Q@p14s>
References: <20251204104009.129483-1-stefan.roese@mailbox.org>
 <b8951794-f720-49a9-9b21-1971a364c956@amd.com>
 <fcd670a1-75c9-4a18-89cf-52c12ff0c07c@mailbox.org>
 <747f8248-bbd8-4580-bc57-3efda9f50eb0@oss.qualcomm.com>
 <d78ab175-e235-4f14-9b36-199209f0da9c@mailbox.org>
 <1adb380c-4b57-4799-8e3f-f9ba5d14eb18@amd.com>
 <aT9g4FcdJdec01_q@p14s>
 <ae1fd2a4-e35d-4907-a08c-a469adf6e96e@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae1fd2a4-e35d-4907-a08c-a469adf6e96e@mailbox.org>

On Tue, Dec 16, 2025 at 03:34:18PM +0100, Stefan Roese wrote:
> Hi Mathieu,
> 
> On 12/15/25 02:14, Mathieu Poirier wrote:
> > On Wed, Dec 10, 2025 at 12:28:52PM -0600, Tanmay Shah wrote:
> > > Hello, please check my comments below:
> > > 
> > > On 12/10/25 2:29 AM, Stefan Roese wrote:
> > > > Hi Tanmay,
> > > > 
> > > > On 12/10/25 03:51, Zhongqiu Han wrote:
> > > > > On 12/5/2025 8:06 PM, Stefan Roese wrote:
> > > > > > Hi Tanmay,
> > > > > > 
> > > > > > On 12/4/25 17:45, Tanmay Shah wrote:
> > > > > > > Hello,
> > > > > > > 
> > > > > > > Thank You for your patch. Please find my comments below.
> > > > > > > 
> > > > > > > On 12/4/25 4:40 AM, Stefan Roese wrote:
> > > > > > > > Testing on our ZynqMP platform has shown, that some R5 messages might
> > > > > > > > get dropped under high CPU load. This patch creates a new high-prio
> > > > > > > 
> > > 
> > > This commit text should be fixed. Messages are not dropped by Linux, but R5
> > > can't send new messages as rx vq is not processed by Linux.
> > > 
> > 
> > I agree.
> > > > > > > Here, I would like to understand what it means by "R5
> > > > > > > messages might get dropped"
> > > > > > > 
> > > > > > > Even under high CPU load, the messages from R5 are stored in
> > > > > > > the virtqueues. If Linux doesn't read it, then it is not
> > > > > > > really lost/ dropped.
> > > > > > > 
> > > > > > > Could you please explain your use case in detail and how the
> > > > > > > testing is conducted?
> > > > > > 
> > > > > > Our use-case is, that we send ~4k messages per second from the R5 to
> > > > > > Linux - sometimes even a bit more. Normally these messages are received
> > > > > > okay and no messages are dropped. Sometimes, under "high CPU load"
> > > > > > scenarios it happens, that the R5 has to drop messages, as there is no
> > > > > > free space in the RPMsg buffer, which is 256 entries AFAIU. Resulting
> > > > > > from the Linux driver not emptying the RX queue.
> > > > > > 
> > > 
> > > Thanks for the details. Your understanding is correct.
> > > 
> > > > > > Could you please elaborate on these virtqueues a bit? Especially why no
> > > > > > messages drop should happen because of these virtqueues?
> > > > > 
> > > > > AFAIK, as a transport layer based on virtqueue, rpmsg is reliable once a
> > > > > message has been successfully enqueued. The observed "drop" here appears
> > > > > to be on the R5 side, where the application discards messages when no
> > > > > entry buffer is available.
> > > > 
> > > > Correct.
> > > > 
> > > > > In the long run, while improving the Linux side is recommended,
> > > > 
> > > > Yes, please.
> > > > 
> > > > > it could
> > > > > also be helpful for the R5 side to implement strategies such as an
> > > > > application-level buffer and retry mechanisms.
> > > > 
> > > > We already did this. We've added an additional buffer mechanism to the
> > > > R5, which improved this "message drop situation" a bit. Still it did not
> > > > fix it for all our high message rate situations - still resulting in
> > > > frame drops on the R5 side (the R5 is a bit resource restricted).
> > > > 
> > > > Improving the responsiveness on the Linux side seems to be the best way
> > > > for us to deal with this problem.
> > > > 
> > > 
> > > I agree to this. However, Just want to understand and cover full picture
> > > here.
> > > 
> > > On R5 side, I am assuming open-amp library is used for the RPMsg
> > > communication.
> > > 
> > > rpmsg_send() API will end up here: https://github.com/OpenAMP/open-amp/blob/be5770f30516505c1a4d35efcffff9fb547f7dcf/lib/rpmsg/rpmsg_virtio.c#L384
> > > 
> > > Here, if the new buffer is not available, then R5 is supposed to wait for
> > > 1ms before sending a new message. After 1ms, R5 will try to get buffer
> > > again, and this continues for 15 seconds. This is the default mechanism.
> > > 
> > > This mechanism is used in your case correctly ?
> > > 
> > > Alternatively you can register platform specific wait mechanism via this
> > > callback: https://github.com/OpenAMP/open-amp/blob/be5770f30516505c1a4d35efcffff9fb547f7dcf/lib/include/openamp/rpmsg_virtio.h#L42
> > > 
> > > Few questions for further understanding:
> > > 
> > > 1) As per your use case, 4k per second data transfer rate must be maintained
> > > all the time? And this is achieved with this patch?
> > > 
> > > Even after having the high priority queue, if someone wants to achieve 8k
> > > per seconds or 16k per seconds data transfer rate, at some point we will hit
> > > this issue again.
> > > 
> > 
> > Right, I also think this patch is not the right solution.
> 
> Hmmm. My understanding of Tanmays's comments is somewhat different. He
> is not "against" this patch in general AFAIU. Please see my reply with
> a more detailed description of our system setup and it's message flow
> and limitations that I just sent a few minutes ago.
>

Regardless of how we spin things around, this patch is about running out of
resource (CPU cycles and memory).  It is only a matter of time before this
solution becomes obsolete.

The main issue here is that we are adding a priority workqueue for everyone
using this driver, which may have unwanted side effects.  Please add a kernel
module parameter to control what kind of workqueue is to be used.

Thanks,
Mathieu  
 
> > > The reliable solution would be to keep the data transfer rate reasonable,
> > > and have solid re-try mechanism.
> > > 
> > > I am okay to take this patch in after addressing comments below but, please
> > > make sure all above things are r5 side is working as well.
> > 
> > Tanmay is correct on all front.
> 
> Agreed.
> 
> Thanks,
> Stefan
> 
