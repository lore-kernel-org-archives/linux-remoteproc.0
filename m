Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7C42FFF90
	for <linux-remoteproc@vger.kernel.org>; Sun, 12 Jul 2026 15:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783871916; cv=pass; b=YbD7M2OX3KiwFyuBaiKn/Ixz470v4ob7rvKnd2+vHsq0CMO96dZcLefLB6aPGpSxJO1lHBQe7oXDiLnuAPoImXZipz4VvIXglTKdjqvhqOy/p6ULpyz+JHq+tQcAQtvEynu4lkmQw7IvKKKFQcvCfhOkXiQ+wdDbYm+WOefI1so=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783871916; c=relaxed/simple;
	bh=aLc7jMiBw2UsKh+S7fgeou6nf+sFln8YPlPnnwBN7hA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QWkduNKAPpdMnvao3oTeG9SmOrWaib/pB/nXQBcaSukqnpimE8WDvW9xVzsVs5JseFhxhsX9s0XYU6rzujKc5spfa53OK9hFopzVnUtwJjnUwTL7hnfFgaAykxiJIYxTgWclaoyLAQkLwB1M9wkC1jh6ToAcjBzo0M20HMChE68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Ju1t7vrI; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Ju1t7vrI"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc73e322dbso24677455ad.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 12 Jul 2026 08:58:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783871914; cv=none;
        d=google.com; s=arc-20260327;
        b=oJyx4c0Gt0fiUg7U3SRpo74ybV+veFtr5/p+IbVX2kTXFELxU72NAgAKrSLv+WTibN
         2E0cpVTZ2n0ye0Y8CUnxOAqRMmA2OSo0YilKWCUUJJSMSoXDPBmbjMN9VA3rgMYCg4kr
         ZLCU/94RnUTfljqnZ/rxqU26k/JVlzxO0A8ip9BaRu7jYky0VlhWkE5OQNYTjtge4yCT
         ryioM5JDVaz5cUkgEkG1fOv6AZbJmCr6mmfJRg2A86ukrdNisF9rOF655g7wpnPm9jzC
         osnMKRCZtISOJJwc7RBbEcSBQirQ+afNgMmNKqGgFJavtt90C9dtS7X9bZ3tTzLpPry9
         rUWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2qoHPnf7RHTkFcOSnpyDI8RpBT/XeamlmMbf/yeH5Pg=;
        fh=KwiK+kIxngCsfG7QwYawaVbGFSW1i30EmbUbqvznIG0=;
        b=oUawGFF9iu7ylRyJEMfUESlSEJIr8PQwUV5umosdqrO0Dpw/9TLDEnafXzpYy+NGE4
         7Dk4853aToJnZwKnNTRSufXsS0P42uPM2QRtj5+fbgyu2+FPLtuiU8XnoCHeTPCnQ4Th
         psVLhXXydncgcMQtHwDgP7j1N2NArnUCXujL0S8XY+2T/8stjwukZDpjPiOv9x6vIqu3
         sJYEHjzGv+n/DOU5qsF9iESmH6VKZSh/TVdt4zNE6CFtAbCQbS5/qepjxqp0k1EqX+q8
         MvIUOArNGbXeU9g7vsE7RjqneTEm6UFdTVIrFjbE8295rpOIH5lhVUUTlVm0BRdl9Nmd
         7j9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783871914; x=1784476714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2qoHPnf7RHTkFcOSnpyDI8RpBT/XeamlmMbf/yeH5Pg=;
        b=Ju1t7vrIVmE884JuROWVsZak9whuWmhZmFheJV1q6mjwo7A4Fe3gUxha4Oi0gjU32m
         hIgHbZF4ooovl2SesTiaohisKzCGzvJyMnlhph6XjHO75qleQKDO9FuQVIgBQ1BRhMSQ
         8Mfr8gkdiwsiDEh34YMO3FybJOEN8Rx6lPiRg/YWjnBn4uHf5YMx+BL2nN3DnwkAI3+O
         OvdMEQTLNG7MUTrlTMimkZdI+r2K2PklP8Vv/dUDMIFO+PP0W0+3pB34TsvrKHB+5yO/
         OVpVs4PCntzY3UZ9MApeueXoGH9pE3+zdyqF0zNZsd3k6IZ6dk7b6+pjsPOTknIsDxOZ
         lmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783871914; x=1784476714;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2qoHPnf7RHTkFcOSnpyDI8RpBT/XeamlmMbf/yeH5Pg=;
        b=dCJNS2STjhNHO45SslkS0EaMWUuycfcpPcuafd7M9YkIu8G8fCwm54NmaA8ywf+u69
         UVBEHsFZUfZFS8HluoI1lqfW455sm+dRJCe5POM9M5sRIB+z3Ji/QWER7qLmc2AQBCLa
         4MA704qG6TIHGvos4BorwogQlamspm1oObpjkzakyFrd6otRv/3tqo8MIF2zAb/rDrwH
         igmsK134fjCQH8xNI7lPGfXnEkHA8DellRWbkVv9ILKuPdwmKx6FGA1ODLlsCtFO1Ny6
         dqjYauEiBjN/w1r4rfNTTbiukwV7htfvXFg93fBkCqkL2KqmD+itLY3xMQVSbvp1et26
         ufNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3BcdL+TuSVbzX2VIQPHSPqR5lrIOjBeEOpvzKlPlcctzQkKFK89AeQ89QMDKfbaBkaqgBGNToRwHb45+9H56n@vger.kernel.org
X-Gm-Message-State: AOJu0YxCr+PeHWZIopLOOEG0c2l49N7/lxHdU0+bfsXgt7bT9vj5yQk5
	Gqhxiil79PdvD6P2JHI5L0ZJmzvj8bupiX9H/qI/p5noTA0zLPuD30c7ru2/0PPJ7ImIxo0zqDw
	Yb/sNKeG+cqts+pSIfo5IXr4+CWJYDZM=
X-Gm-Gg: AfdE7ckAsBUDj9+7GUTCuhsKONQg6fOh4RT4K3pGYuwShGzxVpCPQKy/KIlwgrc09IQ
	10bjGb7bdA7LOqQRFTA2bLZIqq7CYTqAd00BWbIivpvL24vTnRyJRv1VTEG14RDk0z9ud0h64cO
	zVxyt+29qCVsr11fbL45eoaKcFCUNrgULoaBWTkm0YEBJS29Fb1y/ysogecU0QZTRWx0mFwAOKL
	FrbIGxehyl1wyCAp0QQyZJxGgg8/CNDGX+nlOetwN5GL8vYbIVWWwC/G+nCh+V3yz1E9e4kDl7X
	xwjWAVVsQVZvfIKQ+W98FxLxwEkWEg==
X-Received: by 2002:a17:902:d987:b0:2cc:ae2b:b6d2 with SMTP id
 d9443c01a7336-2ce9eac1d98mr62500805ad.15.1783871914381; Sun, 12 Jul 2026
 08:58:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260712145718.126492-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260712145718.126492-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 12 Jul 2026 17:58:23 +0200
X-Gm-Features: AUfX_mxcpSIQ4DLxW6ZIvnxFvpspk6KaYmziRMf8gxBgAEDT5L34RLygHbWHhs8
Message-ID: <CAFBinCDvwvc+qO-_-XUUf9orypOL1XJo+nukC4ZXnB7UtKMj4A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: remoteproc: Drop redundant $ref of
 firmware-name property
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Suman Anna <s-anna@ti.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 12, 2026 at 4:57=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> The DT schema core defines the type ($ref) of 'firmware-name' property
> as string-array, so individual schemas do not need to.  They also should
> not redefine it to a single string, but instead just set number of
> expected firmware names.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
