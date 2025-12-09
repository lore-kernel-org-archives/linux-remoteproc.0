Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83192DC33D
	for <linux-remoteproc@vger.kernel.org>; Tue,  9 Dec 2025 14:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765289333; cv=none; b=abD9LeqllY2o0TeK03FyFZ7wPQAp0yyi0KWrNhJck8zgYVOrc4L8F+qEi1azTl+n85m1CkgXq4oMhjhgJ7sQr3FY/ETZSwVRtyQj5xktFbKPpfakwDQABmDUvfELvfbow255oINMslXCko2OFLBqc4xN0G19BwLK9Q2FHy2axDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765289333; c=relaxed/simple;
	bh=VyyBZwlKUZ2rmYSXMRbs5oz8IUqh5cHk9HMqteoGQSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GStD95+E73nwZbr9jzWavYn8sPUs3SK0D/ZP0s4Z20rb2tCniaoWNSonNE/m9Hio3jLjkVLAv0DuhQ1W0Cc4d9zb1yzLDXWJtPfz8sxvjYg/M9A8Rd8IctbTGFPcn2KpSWPBbwbFnANekizXvT82mTomxbDJFGryhujLFd/EABg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWhIfYVm; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWhIfYVm"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7f1243792f2so460513b3a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Dec 2025 06:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765289331; x=1765894131; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyyBZwlKUZ2rmYSXMRbs5oz8IUqh5cHk9HMqteoGQSQ=;
        b=dWhIfYVmB683y31SqHYkF4w6CqIe3f9Yey3ky+fs01Ybzs31m171f1mkb0druWBI+5
         SEyBQqgAqDNatYhw7BUCsCIm+0PWEWmmWziYbYMpTi99egaWkWURp9EYNwJEZr9jtqby
         X84htk6mahgpp5V1DYRW4+f7JGiu5Alb9QuMw/BClgQjoTxY8AQ07hJRljSYEI+C++5l
         23frCO0sT31R86kvnaoKUGMRDihCQr/ebp6jIhVYq2q72qybdQGnecntVZkRB30EZWxn
         0012uGltZU3Ju4GIDsyy3y9U1KVxDdTsoSad55QNbNO56BwEtSs+M70pjV/Uo32qxm/a
         CwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765289331; x=1765894131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VyyBZwlKUZ2rmYSXMRbs5oz8IUqh5cHk9HMqteoGQSQ=;
        b=BxIVtu9+A9Xjs6EKx7yyW+lYNmF9+0R5D+chitQbloRttSjgGa0vERoMhNPdZ5Sy6E
         eXLmcPA7IOBzJJQZaT6+68pA7yWpr0BPTT/ljWelY6AzKOpZw+FnFZf48Ut7nu4vq6AW
         SdRofekFv3+gancynKZ0Xm/bLaFPjI77N+5BJKcxwwF9tscgAqzU2P20FKFDSIAGx5j8
         zW8A9aA6bP58AtlyMVX8FMMcy0i/9MpZFzDU/TMvM2AWy29jhVZGdgE/QMslZOfey/aL
         XXr8mWJ6gs8VjCq5rMsfksfrhXDcxv/+tlOlLY343XHsV/6k5NelZK757W/tuVpjEJVd
         FF2A==
X-Forwarded-Encrypted: i=1; AJvYcCXa03+tOdMQ+/lIpc1OIfIJ3oOpmPEgsuXwoulxM7Ez3q+/RewTWauJDwjjOPci9AJt0vuL3R8uC/4KNkmd6Bpj@vger.kernel.org
X-Gm-Message-State: AOJu0YxLx6JVekyMyf+mjIvLhgKkdZUs73JoD7kwSQm82laOqhP/KV2Y
	WkdKr2h8iq0vFQ3zACfzYyeKI6yH4uu2/obbD8/zyfUatrgeN0MyIjvw7DIQCMZj194zuSiA6cg
	RFmbt/P7C6Xa5xGxB7si1+AfkIod2dXI=
X-Gm-Gg: ASbGncs+okbGN4/h8G62sDueAAFkcPSKbnzgTGtQzDAK4ZJc8k5YTRlfrSSpdaGZZ/G
	QLIiBbs7v+waeAXnOj7reTGf7sn4/YZ0WIlN27FsNIMWjlZU9sDUZYqpujrhqtqysXVVJt0vwMb
	RusOgMNj4S3Aw+E6hDLK3980AqlaJvy8vxVZZ5nXFDSdA+qCzZMBRD/L5j5fuS5PjWh8+l7huw1
	ly7yvIkG1V59OJA7CuEy724QH6jsgrzqM7icm+MadSR+5Bn58zoEXKeQs7Avas+WByLJf3hrQ1c
	TzJdwcBRjeMiX5DCqceNvAqcmkvFVaZVbntFpvbenx6v8ildRj5mXIRvkqas04yFCoMdMg08SNS
	Ug699uYn9fw==
X-Google-Smtp-Source: AGHT+IGlAhSuqCl2kRyMGsShmSil97vNdY0PHNYfllyi4vyK36zscoZ6DMWDYGU3rPKH1rKNgSPRieolC8FcfVHxjzk=
X-Received: by 2002:a05:7022:423:b0:11b:8b4b:bff7 with SMTP id
 a92af1059eb24-11e032ac942mr8661512c88.39.1765289330793; Tue, 09 Dec 2025
 06:08:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251204122825.756106-1-iuliana.prodan@oss.nxp.com> <20251204122825.756106-3-iuliana.prodan@oss.nxp.com>
In-Reply-To: <20251204122825.756106-3-iuliana.prodan@oss.nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 9 Dec 2025 16:11:19 +0200
X-Gm-Features: AQt7F2rz9EfsJBbiHeX3xN1JnTkS5oOdOlbJa4JQf39jSVqAGLuMb5NMx16wl5A
Message-ID: <CAEnQRZDw-jwpXdb3oi+-DZ+YD4aQfyON0gPNrGpox1v7m4Voig@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_dsp_rproc: Wait for suspend ACK
 only if WAIT_FW_CONFIRMATION is set
To: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	"S.J. Wang" <shengjiu.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, imx@lists.linux.dev, 
	linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 2:29=E2=80=AFPM Iuliana Prodan (OSS)
<iuliana.prodan@oss.nxp.com> wrote:
>
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
>
> The DSP suspend path currently waits unconditionally for a suspend ack
> from the firmware. This breaks firmwares that do not implement the
> mailbox-based CONFIRMATION handshake, as the DSP never responds and
> system suspend fails with -EBUSY.
>
> The driver already uses the WAIT_FW_CONFIRMATION flag to indicate that
> the firmware supports the CONFIRMATION handshake at boot. Apply the same
> logic during suspend: only send the suspend message and wait for the
> suspend ack when the firmware is expected to support it.
>
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
