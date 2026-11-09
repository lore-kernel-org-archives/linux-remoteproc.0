Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794261782;
	b=PWs+OsZQrO9V2gv4Ahj9bNAV5r8nBSTokDOOZtYBtY+83P+XsAUg1xWqlkmNInPFpfNd
	 Jn3+sVeh9TI32oRjDH7RYviIGscBRTj2A6yaQRJsKYhNrXsgm5x7q97WDOBEIQAJe9XCG
	 rI22RDJrRqEZ4g8+zWpVw+PM+H7+MtUQTpJNns1SaHMLT7UnH3fNTKt71pbjq1bzHfs+U
	 JJjolLAJtL334OAncZSlQm6e1SsGtW2OzSMf4o4tuJrz5V5eJhbPK23XW+hFgSAPDyXPZ
	 uGMNZo6tavWvIgF0W+xB9FZGTTEI/XnA/9Cq159SMFJVBQngZP0w3Zt3lrI4kw1z39w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794261782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/4B+HMYQGdeNoawaC8nb2MBw5WMuUhGF+veGWpIt95w=;
	b=X2OCGp+8mfxD6tOwXjJLK0/w/uQLciMfQn850GzuQr8zoqUb0/mEjmZwFT/84HtJj6xP
	 a7e4fKdyLUDuXlv5/8FZtARv5GGQwyo1YIYA/NZCk46o6FnaywTTBA7GJEsai1s1o7HWK
	 CvXAeF7FhbmTN3Sx2qS1vubKdiSKwzGBIs90lMgtNWIt9E5GCr6Ca/cG1dDozDDANeQov
	 KtH+jswnvsZLLXBxpOz0jrOHhRIzRLvGJTi0L5dsRJ4Pb4NUbEHd4+2NoCA23Y7AcGKA6
	 nse5ojpok4PxmeqCN7ASqOAmXoSeGY4w5JbqAN5X7/+7cUKA5LntAO19vCUJqhlyYdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=luxonis.com;
	spf=pass smtp.mailfrom=luxonis.com;
	dkim=pass header.d=luxonis.com header.i=@luxonis.com header.a=rsa-sha256 header.s=google header.b=BSUTlFht;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D16C606A33B
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Nov 2026 22:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D16C606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=luxonis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luxonis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luxonis.com header.i=@luxonis.com header.a=rsa-sha256 header.s=google header.b=BSUTlFht
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b581b6b0e9so139515a12.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Nov 2026 14:03:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794261781; cv=none;
        d=google.com; s=arc-20260327;
        b=EHbrHQL+pv3gMG+DwNs2GiEQRJM76mvNoGsiJiz+/QzbGGqM2E5gQISjqXsH2QSLFH
         pcLbh/3L9rgOADTCBrhaNych8CjAe8u0XNy7rQP3VJAqGZ2vdooWtmpDWWCyLBlpj1+t
         8XTWl/mwyWLP106hHw4TTkc4f+lw81Rr2IjhGUBbg/SE65sp+G/TKodyHfAMzcxGITA1
         oTSWJsSmkJ1cWu9QpxMi2WL9II875eypqQtHNP7W4Grzg8GL6hGoW9TJ8+AywY/yZ6XQ
         yu3lnXS/ZxTGLGeFwDkndj8at2JN8sq8bUqHjcQGDdOfSNxBsgGjXeW2zPZ+/vbAL5Qk
         ocGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/4B+HMYQGdeNoawaC8nb2MBw5WMuUhGF+veGWpIt95w=;
        fh=88MKjTgR/x6MOG8pLtIvGwcyARqRn3pHlXXGWKFrHnY=;
        b=QVmC4BSSMCGQohQyfbOxHn/8wMmhHKK3Dd9JJX0aWbRcUBdMz5JSDlGTUDzYNF314S
         0F7N2U4uGfq1Dqr7XgZQtr1oyXWpFib0IBCZGcytvxNFcZ40o7bC7Pgs+Mq/LUYstcO0
         l9GoirmVFE0ZJ+Y73amwY1yVZ7rWUEcw+HHhX5M5FOFWr/WxXPuKrIQFQN2aaTj0/t8t
         XxZiMsfvI1JhPc7F0wOknydCfTgNp53Xf7jldiZIN37TU1dH2H/5spaeZOeiItVR0Ldl
         ZAh+3mcCP2IIMV/JiCxA1aJfvrNTnIG+pNKzLIjbSrlT+nYtbptEIDriMFbyi55XEbGP
         fAvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=luxonis.com; s=google; t=1794261781; x=1794866581; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4B+HMYQGdeNoawaC8nb2MBw5WMuUhGF+veGWpIt95w=;
        b=BSUTlFht39VNuJ/f2J56X1s7bZ7V2SNgiXfLZnVcGiL1jIU4NznY9fE2HkjZmULok1
         x60Vf3QAfEuCA1jvHmnHu1CC9AcJp08kuvVT8l5qpx4T4NU4ylgNZf25JIwR3YHhAKQd
         Qn0z40snzSs1+K11hpetvZMTri1kDGLdQ9Pmb6pGGbbcBhaE0eUIspki2qJK0xwomhJY
         Rq/8cEG+xuhEWuV8g+0jDwvIqDpq26NFGtV+XemcHnqOwpN6iQVJ7qI59pGoQpyzGKeA
         +f14gx25gOszOrAfXaYBcvorgkduohNMqwnYMIgQYPwprPWNiBPoveI/vOSv0NZUaed7
         dfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794261781; x=1794866581;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/4B+HMYQGdeNoawaC8nb2MBw5WMuUhGF+veGWpIt95w=;
        b=SF1UAOs1iT0XS1am0zkbRAcbK8iPPRaD1dhPrhkcuAqR5Z1NmU7sndpxTu3Hv9n7vx
         LurI4fuQa8HDNHKm/C2ZAvhmhfFWkQ77sZrtPWx21Lt4jWqSRTnE55uDl2pIrOu/Sv9r
         bkNbNYXtsNz9dl/14hQMCQvDhxbkJqfrbJrWulz/ofzk020lLuy6AbP2HVbnoLinfB8W
         wNP1/z8wtnQwTzH2qM8ELnechwY9MipYT2oeQFrzIOJtsPvV0zwzTnAYHfOgVoBHh3wb
         9Q0b0kyp/700xEDsA7asko13w3Jc83t+AxiWZHPSZPRbPFlCXfub1ZsLs/MgIYfiEuDA
         EiCA==
X-Forwarded-Encrypted: i=1; AL+hErG9kL2IsB5KyapzubQCYB3w67qWcpaUMT1wcaIq2x0zEyq7X5yuY5y2ACmBXuziDdNJrVPQFLAPgfcDNSEkSFdE@vger.kernel.org
X-Gm-Message-State: APuU4Z/YG9Kp16gQ/SrfhfoE43dTP158L/kMshgyk4126IcOGgsSolqq
	y4KDxTZtHX2hCy+xgxirGwpPYBGYEaQXYKi5/eRQ2l28QxqHOE6TPfHK3ynpyc4FIdNRDkykAzA
	E2MWbwxARLsx3LjfemTrjUfkBGloTNvnA23qNH99D+Mr0sB/eXLgP1ys=
X-Gm-Gg: AYBFou2A6M4c59LwEAQzirOeEkhR71TgYdLz23SZ/27SdyF7N9af6tPKpYnll81S53w
	zBO5Xkll3OnTVYIo2782Ru43/l2KxDoqeP5aGHnAayToWmc2AOSp3/HeJ397B8Zpwdr+c/wAx7k
	BBtCptr1t7qNbKUjlDjjPTiU9uUYIAvQ1aIhjOGqEQS+M7HMIhl23F3UUXDf0Fsx69/jfu2IqZB
	7vaxPLiHgn2qkl5+dQ8zYyzrNh2N11HzXXlZ/kgKkNsSLCZyIAKrQupGIXUBFr1s90iP8pyxdHr
	2VBuZ5+X9ZukhgNQxMsJ2fbbvMinj/TdLrwv2r3HudeHsyylMBl3fdi0Za0tlbPHdzfLKbkpFCh
	/BGA3t+gi6TcPZF/CJu3KrxVoNgwEX7+mgGg=
X-Received: by 2002:a05:6402:c45:b0:6b3:e89b:126a with SMTP id
 4fb4d7f45d1cf-6b7565f7d6dmr640342a12.12.1794261780736; Mon, 09 Nov 2026
 14:03:00 -0800 (PST)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109175752.793130-1-jure.rebernik@luxonis.com> <25204208-5fcc-4b00-b359-86fc5f124700@packett.cool>
In-Reply-To: <25204208-5fcc-4b00-b359-86fc5f124700@packett.cool>
From: Jure Rebernik <jure.rebernik@luxonis.com>
Date: Mon, 9 Nov 2026 23:02:49 +0100
X-Gm-Features: AclHuK-cvftGYpN4mqto5HWIYSl8oeGTMovdxZCsAtUy9fF3sq2BZncPc5FuUyM
Message-ID: <CAD9jT+r2gBSbcO7CVu_YLhiJja4PDs6O=7v5g-VM_RYx07=4Jw@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: qcom: pas: Request stop before tearing down
 GLINK and SMD
To: Val Packett <val@packett.cool>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	konrad.dybcio@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com, 
	linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Val,

Thank you for looking at the patch and for offering to test it.

On 11/9/26 10:40 PM, Val Packett wrote:
> I've been seeing crashes in sensorspd like
>
> qcom_q6v5_pas 3700000.remoteproc: fatal error received:
> EX:kernel:0x1:SNS_SEE_I_0:0x10000025:PC=0xf00280b8:LR=0xf001f>
>
> on a Kodiak device (sm7325-motorola-dubai) also cause a whole-SoC reset
> right after logging that, when trying to restart the ADSP.
>
> Those are somewhat random and not too frequent, like once every couple days.
>
> I'll test this patch and see if I no longer end up with my phone
> randomly showing the u-boot menu when I pull it out of my pocket :D

A test on Kodiak would be very welcome, thank you. I should say up
front that I don't expect this patch to change that case, though. Your
log shows a crash that the firmware reported itself:
q6v5_fatal_interrupt() clears the running flag before it reports the
crash, so qcom_q6v5_request_stop() does not send a stop request, with
or without this patch. The patch only moves the request that is sent
for a crash the host reports, such as one triggered through the
debugfs crash file. I could not inject a firmware-reported crash on my
boards, so I would be glad to hear how it behaves on your device
either way.

> Try not to provide the free advertisement right in the commit msg btw,
> and to make it sliiightly less verbose.

Thanks for the feedback, that's fair. I added the note because
generated-content.rst asks for tool use to be noted in the changelog.
I'll wait for comments from Bjorn and Mathieu, and then send a v2 that
cuts it down to one short sentence, moves the details below the ---,
and tightens the rest of the message.

> It looks a bit funny that "stop is a device" but well, it's not like I
> can think of a more elegant solution...

Agreed, it does read a bit oddly. The alternative I could see is a hook
in the remoteproc core that runs before rproc_stop() stops the
subdevices. That would change the core for every driver to fix an
ordering problem inside the qcom drivers, so I kept the change local.
I'm happy to rework it that way if Bjorn or Mathieu prefer it.

Thanks again,
Jure
