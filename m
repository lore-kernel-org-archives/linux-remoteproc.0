Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70181186E40
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 21:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766007294; cv=none; b=mN6BeIvAfpBlDldhea+TxKxVcMW2QsIuQiJAvhbho5XMBsHCg130b1TEv5b1AzJcFgArB2UhE99TV/BRuQVId3ugsJPaVBBbRDTdhGDDc7b3GeJ/YZi1hpq0p6vtJg6FPGXB1FR88cZv6mo0qOSa5tkn1eNauUo/oesv8YkOdMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766007294; c=relaxed/simple;
	bh=fP3z5/HYhD18gkhnM3O54HpqzcbRUFfN692QHzZF4ew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5y6BLy/4OWN/maYUndBt8WGXxac2YwVzOXNfZRDDjSNmOpiM7HFjTKPfPCF8pkVd5qCVS8b4MMW5uQZOWWNDM1NJM6poUJhbIF5z/asJUU6ye+5fISzePg+wsCgRw4ASIhXoesJ5Yg5tUFQEPba2lixfJPV8vtximGRUYrgmMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l10g0GxW; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l10g0GxW"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-7bc0cd6a13aso610408b3a.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 13:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766007292; x=1766612092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A4b5ifQZruIGVx9s0slWa2bbFL9YyKUVPkNV1BXoMYY=;
        b=l10g0GxWZZAEROWNAdXKvjdQW87m+VtCsSduLAk1tA0XXMUBgDpzHiRNNqlk+5tddW
         th10AvqXCFQOfkXs+mA3Ii+tpzFFUIadCnSSt8MI/VDlRKroluUPid8O6kZ3VIVbPSTV
         82YTNnsyETcko3Vfsa3jq3BRlHO9YL9rdK+lmOHvaZUGpDnt1t+agaETGN+uVTWZexCy
         iYzJjduK++jxSiTGCkPkOGB8xMsW9RKWUOpwZWhN4Dazh6gBhWyLT/dotJBwFCULFSlH
         ooQZkvNQ4lJhttUmV23uXaNnX4KqvHCK23iOlyQhTtiURz++dG3tXO0yt+b8VKzuXYWK
         FNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766007292; x=1766612092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4b5ifQZruIGVx9s0slWa2bbFL9YyKUVPkNV1BXoMYY=;
        b=fVuEuSKgKs8Jy2aS/gj5Mhy+vWJgV92JVqh8xgdTS+X/DQ2PyJRu61ogJEJBn4QDHC
         JB9+JH2yLwa/lrKKBJ1B+G3c3IBIO4Ok5C7GVOVuoswsw8lAo70+JEU1cYzazQ30loI6
         sGQJPPP8W8c/MEGWbML1SzLPWWDlU+VgnFJs7jTzoZryrCSg951Zek9tqwXroHTjzupj
         vQQYEyA2t1oifdB8cZPStwVqz72a0DxZkzKbGAsFMQo0yXVptgpWwkJ2Rx5dXI/uuP1U
         DYP5o7zrvwY4suwg5TCCg4iX7CxgsXBoTM3eKECHwSf6iWYBGtq0wZkhUSR7REvRWJwv
         QLHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm2z081KjXN8WfXKeh57u1HeMUVLdjdHFDOML0e16Uui5oxCq6enbtorG1HPEa0kzU6AmaSN06ZY7y1R4Un18k@vger.kernel.org
X-Gm-Message-State: AOJu0YwlVj+YsI02FpR1HGJDmGzfEUFQcsH6kL0Z5ribi01kEHf0ygk9
	a4YSeAiyNxKTeg+qYvBRouTQtOci9i8CfszG+Jsgs8tAlPJ+96fKwPH4G6c/aYoTEag=
X-Gm-Gg: AY/fxX7ZC6JlSCr9gV6AQsppUrTcmC3+P9+BqDCHoIQHSafFQI7sWpVF3Rafuz7k8ln
	YQUB4wtQ2yM4fIDcZXf9VdqcwA0csZrWLu3jRRW6Y3ZBAubKKjHJMBpoZ7Dy0b0rB6V+i2n4x/V
	6xyLn5YEBwYN3Yba5yWaTVq/+0CNv1YhNjrvYTWHckOfC1/3OxG2DqvRHTaz9D1xdIVds+HgDfq
	weUgkgE24z0u6uBlOIjD5l8qYX32pZ9ebk2VfSiPbUzYf32NBXnfxnaIM4DH3iBFHg6i6taO4Wk
	D1cnKFJimLzI3I4I9T4E7Wg3QzfO+Uq/oeZxA156y6Y+vAUXltWp8aHLuUCqCEDJkpNsEqxT6AP
	iVFakP+6yJ5zJgmIw8WnvNZNZNFEb+F7XtkvXTmr/grhg2w5ZPjXUanb68T9+Dg262hNCojNJIH
	qUPYZkpFhE4FVLZdg2V7IK9sY=
X-Google-Smtp-Source: AGHT+IGT2oevgIpWDaybZAIvvNxUj7y7GoqU2eikUsukV5GZbiF10NQC566+72lY4rmfVcqhV9LZJQ==
X-Received: by 2002:aa7:8014:0:b0:7e8:3fcb:9b04 with SMTP id d2e1a72fcca58-7fe0de7142fmr520520b3a.26.1766007291514;
        Wed, 17 Dec 2025 13:34:51 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:cfb9:c35:9f28:8222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fe13d85330sm411118b3a.37.2025.12.17.13.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 13:34:51 -0800 (PST)
Date: Wed, 17 Dec 2025 14:34:48 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Stefan Roese <stefan.roese@mailbox.org>
Cc: Tanmay Shah <tanmay.shah@amd.com>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [v3 PATCH] remoteproc: xlnx: Use high-prio workqueue instead of
 system wq
Message-ID: <aUMh-B5IPtFfjS-7@p14s>
References: <20251204104009.129483-1-stefan.roese@mailbox.org>
 <b8951794-f720-49a9-9b21-1971a364c956@amd.com>
 <fcd670a1-75c9-4a18-89cf-52c12ff0c07c@mailbox.org>
 <747f8248-bbd8-4580-bc57-3efda9f50eb0@oss.qualcomm.com>
 <d78ab175-e235-4f14-9b36-199209f0da9c@mailbox.org>
 <1adb380c-4b57-4799-8e3f-f9ba5d14eb18@amd.com>
 <aT9g4FcdJdec01_q@p14s>
 <ae1fd2a4-e35d-4907-a08c-a469adf6e96e@mailbox.org>
 <aUHTbCVdG6i1hA8Q@p14s>
 <f4071b82-e4bf-49f3-81e7-7a03f4976027@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4071b82-e4bf-49f3-81e7-7a03f4976027@mailbox.org>

On Wed, Dec 17, 2025 at 11:27:44AM +0100, Stefan Roese wrote:
> Hi Mathieu,
> 
> On 12/16/25 22:47, Mathieu Poirier wrote:
> > On Tue, Dec 16, 2025 at 03:34:18PM +0100, Stefan Roese wrote:
> > > Hi Mathieu,
> > > 
> > > On 12/15/25 02:14, Mathieu Poirier wrote:
> > > > On Wed, Dec 10, 2025 at 12:28:52PM -0600, Tanmay Shah wrote:
> > > > > Hello, please check my comments below:
> > > > > 
> > > > > On 12/10/25 2:29 AM, Stefan Roese wrote:
> > > > > > Hi Tanmay,
> > > > > > 
> > > > > > On 12/10/25 03:51, Zhongqiu Han wrote:
> > > > > > > On 12/5/2025 8:06 PM, Stefan Roese wrote:
> > > > > > > > Hi Tanmay,
> > > > > > > > 
> > > > > > > > On 12/4/25 17:45, Tanmay Shah wrote:
> > > > > > > > > Hello,
> > > > > > > > > 
> > > > > > > > > Thank You for your patch. Please find my comments below.
> > > > > > > > > 
> > > > > > > > > On 12/4/25 4:40 AM, Stefan Roese wrote:
> > > > > > > > > > Testing on our ZynqMP platform has shown, that some R5 messages might
> > > > > > > > > > get dropped under high CPU load. This patch creates a new high-prio
> > > > > > > > > 
> > > > > 
> > > > > This commit text should be fixed. Messages are not dropped by Linux, but R5
> > > > > can't send new messages as rx vq is not processed by Linux.
> > > > > 
> > > > 
> > > > I agree.
> > > > > > > > > Here, I would like to understand what it means by "R5
> > > > > > > > > messages might get dropped"
> > > > > > > > > 
> > > > > > > > > Even under high CPU load, the messages from R5 are stored in
> > > > > > > > > the virtqueues. If Linux doesn't read it, then it is not
> > > > > > > > > really lost/ dropped.
> > > > > > > > > 
> > > > > > > > > Could you please explain your use case in detail and how the
> > > > > > > > > testing is conducted?
> > > > > > > > 
> > > > > > > > Our use-case is, that we send ~4k messages per second from the R5 to
> > > > > > > > Linux - sometimes even a bit more. Normally these messages are received
> > > > > > > > okay and no messages are dropped. Sometimes, under "high CPU load"
> > > > > > > > scenarios it happens, that the R5 has to drop messages, as there is no
> > > > > > > > free space in the RPMsg buffer, which is 256 entries AFAIU. Resulting
> > > > > > > > from the Linux driver not emptying the RX queue.
> > > > > > > > 
> > > > > 
> > > > > Thanks for the details. Your understanding is correct.
> > > > > 
> > > > > > > > Could you please elaborate on these virtqueues a bit? Especially why no
> > > > > > > > messages drop should happen because of these virtqueues?
> > > > > > > 
> > > > > > > AFAIK, as a transport layer based on virtqueue, rpmsg is reliable once a
> > > > > > > message has been successfully enqueued. The observed "drop" here appears
> > > > > > > to be on the R5 side, where the application discards messages when no
> > > > > > > entry buffer is available.
> > > > > > 
> > > > > > Correct.
> > > > > > 
> > > > > > > In the long run, while improving the Linux side is recommended,
> > > > > > 
> > > > > > Yes, please.
> > > > > > 
> > > > > > > it could
> > > > > > > also be helpful for the R5 side to implement strategies such as an
> > > > > > > application-level buffer and retry mechanisms.
> > > > > > 
> > > > > > We already did this. We've added an additional buffer mechanism to the
> > > > > > R5, which improved this "message drop situation" a bit. Still it did not
> > > > > > fix it for all our high message rate situations - still resulting in
> > > > > > frame drops on the R5 side (the R5 is a bit resource restricted).
> > > > > > 
> > > > > > Improving the responsiveness on the Linux side seems to be the best way
> > > > > > for us to deal with this problem.
> > > > > > 
> > > > > 
> > > > > I agree to this. However, Just want to understand and cover full picture
> > > > > here.
> > > > > 
> > > > > On R5 side, I am assuming open-amp library is used for the RPMsg
> > > > > communication.
> > > > > 
> > > > > rpmsg_send() API will end up here: https://github.com/OpenAMP/open-amp/blob/be5770f30516505c1a4d35efcffff9fb547f7dcf/lib/rpmsg/rpmsg_virtio.c#L384
> > > > > 
> > > > > Here, if the new buffer is not available, then R5 is supposed to wait for
> > > > > 1ms before sending a new message. After 1ms, R5 will try to get buffer
> > > > > again, and this continues for 15 seconds. This is the default mechanism.
> > > > > 
> > > > > This mechanism is used in your case correctly ?
> > > > > 
> > > > > Alternatively you can register platform specific wait mechanism via this
> > > > > callback: https://github.com/OpenAMP/open-amp/blob/be5770f30516505c1a4d35efcffff9fb547f7dcf/lib/include/openamp/rpmsg_virtio.h#L42
> > > > > 
> > > > > Few questions for further understanding:
> > > > > 
> > > > > 1) As per your use case, 4k per second data transfer rate must be maintained
> > > > > all the time? And this is achieved with this patch?
> > > > > 
> > > > > Even after having the high priority queue, if someone wants to achieve 8k
> > > > > per seconds or 16k per seconds data transfer rate, at some point we will hit
> > > > > this issue again.
> > > > > 
> > > > 
> > > > Right, I also think this patch is not the right solution.
> > > 
> > > Hmmm. My understanding of Tanmays's comments is somewhat different. He
> > > is not "against" this patch in general AFAIU. Please see my reply with
> > > a more detailed description of our system setup and it's message flow
> > > and limitations that I just sent a few minutes ago.
> > > 
> > 
> > Regardless of how we spin things around, this patch is about running out of
> > resource (CPU cycles and memory).  It is only a matter of time before this
> > solution becomes obsolete.
> > 
> > The main issue here is that we are adding a priority workqueue for everyone
> > using this driver, which may have unwanted side effects.  Please add a kernel
> > module parameter to control what kind of workqueue is to be used.
> 
> Okay, will do.

Please see this patchset [1] Tanmay is currently working on.  I would much
rather see that solution put to work than playing with workqueue priorities.

[1]. "[RFC PATCH 0/2] Enhance RPMsg buffer management"

> 
> Thanks,
> Stefan
> 
