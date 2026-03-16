Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5578D3CCFA7
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 16:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676868; cv=pass; b=Gjg9N2Kf9huDdAHQgdpgN470J+Dp6mwnfwSyC+Ri1pn8/WR/SoNIwTXr/oJUxF091trm7+49efw6zjMcYujuWP0BURf/JAHsPk8nhbfz85b92Rc9e236fl0Vz4d274nyWj9Y7tDSM7VmvgOzLfHeBy7nJME8MhwQgXT0jXYhHvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676868; c=relaxed/simple;
	bh=nRTROiegC3HHzc2PKkDT6LEu+pHZlAThf22kVsmxLDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oqNfOL+YuMLhmquxHKHWYgnC697zOGkUo6zEQtz09NE0KnavB9N5GhcAt5CYxEDuVzz4Ej+qmrEfyFqE/0ZAvgWMH4vz0sw6p2fAjxHrC6PL6WBe0A4miYc6UipcZXMyGv6IjJ6Rzn0PF58P+zvWCRLU3UJErrZtoMhToqaeb9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tRvR8jWP; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tRvR8jWP"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6618bc129acso6104476a12.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 09:01:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773676866; cv=none;
        d=google.com; s=arc-20240605;
        b=ePKvfXCGFpWartTxnSMDwaY8yj1NTyNMm3eBvP9a4RgRz4ZnplLLuDvibak2B8wJZN
         eVXkamvRk2CRZ9po7YS7B1luMneJs03H/VywqznUnj65Do0EtkBL2dY2iNljYJmSrcs5
         BjtmL1IZ2HaxZhTqEB1MMPUiDix7auEsJFbAfR6BM6xI0edttGSdCXD0eCxGXLVM7f8K
         SvNjo8dNDnNg8XEthTA2FNbX2KShMTbZxu/7SorOJ9eLu5qpVjvKFnTxUTbPQTXICJPV
         uxd92Me4f/7Zit9Njzc9OTeB+GinwnN4hH5wa6UcLEU3vgiNc6kG2FQz/xc2ETDqlNiA
         na6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nRTROiegC3HHzc2PKkDT6LEu+pHZlAThf22kVsmxLDs=;
        fh=NeQE3iCmWZMVk4l7zSvNIRhxV5C1QP9Zr9nIbDtL85E=;
        b=QBmqWnEOOv+YWKCimtPCzbV/cLixyNjGtnJRlnLyWUzVsX/bU+G5Ki1D7j+F80ponM
         27QJJIVDfawD0AC/8nJQZEcwNqDXJWJ0Lb4wdnKIBJEV2i8xhtjpBQrqvpDLiBBz+euy
         qu3/aJnUGDu4lavase2H54Ri/5buhgyn4eeLZ7ym4Jd+M0aNhsLKKhdg682wZJLJkzNn
         z+sg6gxcvsUUxvJ3xL9UNpK1fLxZeu/R4rKp75caU6J+C+RKSgINePKdt3qy5kJNJ5xz
         WAPZ5avgOghm4U57vHo5wEiBW85P/SSKvxr5KArMmBOe6bE3QI3kAe9A8QRlBzPQSDq3
         9A1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773676866; x=1774281666; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRTROiegC3HHzc2PKkDT6LEu+pHZlAThf22kVsmxLDs=;
        b=tRvR8jWPdYpapywuFbFHAwdbkmfciAm97lupRo23Lz95ol4WDw47KF+V049m3ECDKP
         khDfrPMN6aR/vimprZmLRF6GU2CkUGsd4Jv5xtJGU+u1yNjoX+Yy544KdjdWYeVUqwvP
         PAuT67hKYlEjtdFL0MRqVeSCfe5qhhfNz5y8pDlti3aC5sbdN5iYW7S3kFsgmreBC4CN
         qAGJEDXXCt/WGvWjeZrLQIJq7Yect+cT6Mb1tiyLaxvjXE+m/ds4hH8ov+Y8sMqZNrSm
         SWPoHKrCT3TVDDSq/C0ySD3PoMmRqSWtUYuAZVCOsx/LSb4q+nVLCCHHlStxxvaawLlT
         Ym6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773676866; x=1774281666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nRTROiegC3HHzc2PKkDT6LEu+pHZlAThf22kVsmxLDs=;
        b=QqD3bPRUX5yT+Cl4JtD057IS7uhCp0nH5HE1/F7jRN6TPFNtXuEQFvlMveq9+yZXfq
         ZBt+s4qz41R9eIPfWFCnMebZ56DbqQTLVApf8rwTzgFYjOX9BbY+tIWk/pKK9994DFN6
         S88Ey59h83+XuZAGlKU9nhw15J0n/GuwbEZrmBcVWXDoRhQjLfSnytJihdPf6ntn4wVx
         3z9KCgB4JJW3nEFlwTHb/3A+qqLQL8SE49Oy7xtvbKxGixb2t2oIzmNLjUSC2O3pbdhV
         +S6nRp+doDSKs57WYCspqlTciV15/THZNMY9UArOAPYCxYiguCtCDUxDceaqT3TaPADj
         PWkg==
X-Forwarded-Encrypted: i=1; AJvYcCUDLfQp14soY4eiiectfSGdWVND4Hb1yzIBs6y4Gc9v932J37lhOEou1mfM3d7J2VqfiIw8KM/jTZxtnM6rTSOS@vger.kernel.org
X-Gm-Message-State: AOJu0YztLObGb9C/CMwBw60s1hHtJDf3qUG42Hz87q/45pA6B15wUwdQ
	HZ5xDW6V5DEr8/lzclAvg1u1s5F46HuOuchYOoliloM8dbm+34Lk6CyyTQ21+E71ZYrHR1n6YSj
	+fCVMrWEAKjGqJ2q+i2TiEuaAlNWe8/6FKYg+XESHbw==
X-Gm-Gg: ATEYQzzTpr7nvYHzSseCuk0wqtXTN7Dk4yAq2i/dz8oZrSrbBdldp2YgKTTfiRNn0Jl
	Gn02KFQczQW+8YXmE/kIjCZ1SXOnuaaeP7WCBgpKNWJZabtEMN8bUv883oSAejdyEfcT2e9Lhvv
	csrLNk/5npo8NsYauQ/1Mknv3mNuiaDvaIF+XHiWhib0derRD64BtcZUCaqU/rsaCmdKl9fQuo6
	hAYWuH5NxJSglfUkagOBpQZTzOnJegBRtIkY6SbVbt/eOV3J/YULxtYGP8NwpYXLzsgLIEMflyL
	tFV1yXkuCaznTaLVBvmDLt2pHO1w8leVUuXF32iRFg==
X-Received: by 2002:a05:6402:51c9:b0:65c:2af1:b7e2 with SMTP id
 4fb4d7f45d1cf-663bac17dcamr7423927a12.27.1773676865593; Mon, 16 Mar 2026
 09:01:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313195801.2043306-1-shenwei.wang@nxp.com> <CAD++jLkVZc7J+39eUtpWz4+YQm035HDtUyiyrEFGifQkcSMsCA@mail.gmail.com>
In-Reply-To: <CAD++jLkVZc7J+39eUtpWz4+YQm035HDtUyiyrEFGifQkcSMsCA@mail.gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 16 Mar 2026 10:00:53 -0600
X-Gm-Features: AaiRm52a6xRhLIv8WCDX8JG5wzLTI5tmdCIrfHWi7mJRzbOdI91SV43T2PYw5ig
Message-ID: <CANLsYkyd8x29kz1u2dkyn_5hhWVJehz6VVKEx81Ew6i1nKObwg@mail.gmail.com>
Subject: Re: [PATCH v12 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
To: Linus Walleij <linusw@kernel.org>, Andrew Lunn <andrew@lunn.ch>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, arnaud.pouliquen@foss.st.com, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Adding Andrew Lunn]

On Mon, 16 Mar 2026 at 08:23, Linus Walleij <linusw@kernel.org> wrote:
>
> Hi Shenwei,
>
> On Fri, Mar 13, 2026 at 8:58=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.co=
m> wrote:
>
> > Support the remote devices on the remote processor via the RPMSG bus on
> > i.MX platform.
>
> I think v12 looks pretty good, if Arnaud gives his ACK on this patch
> series I think it's ripe for merge.

Please wait until Andrew and I have provided our RBs before merging.

>
> Yours,
> Linus Walleij
