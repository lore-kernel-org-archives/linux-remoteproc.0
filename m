Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CC3274B59
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 14:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773671025; cv=none; b=Fy/Bd9thCMdTAMIVwEjOgurQ6llEW+AY+jLIA7TqLesF/haU6zYOth3FkA4QQvCqxOuk9NHe03XuGOeDXurZKmH1G19wrsRjMqQzb2fsF7aPtmKfQsu5X/rksAe7DXf4wX5Yu86WLPjmNIwpgC4+lISo1Gnq3ebz/Gk8ZE2Oekw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773671025; c=relaxed/simple;
	bh=o9qImMPTFN9l13pEaVZexXF0+F/wHlqkeGvCWUWvFc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eqo/jLEOaiS/SrgTl85ksdmc5yOsBzUvbkBhRDTyQAIR3COESvpTxCc139S8je2zF9CAj620M5FGfyWr3C3JQ7sh0/2/fwLum/WDCkL7cq6k+yVgkbFQ0DUdWouSDt+goVTdDcFq9aiCTjQIns78x7JTD8pcpZdE3g+PJxbJ8WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NzGLe0Mx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NzGLe0Mx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2084CC2BCF4
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 14:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773671025;
	bh=o9qImMPTFN9l13pEaVZexXF0+F/wHlqkeGvCWUWvFc0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NzGLe0MxaJ6b4oDrU7jIw7POfBs6WQhK9MokUeJZmK1iorKNGExFfp4+cbDRBy1+r
	 MwB38IheT63yy32AjDHKZp26QAFHx2O1TgGdVGS1K8zk8OAf+7bqjMfJwfSpKyviIg
	 GqlarZ/EtuYdo9tj1+ZfxKFY8Eg1WowSXVX5/nwLQn532pLRUGz/l6tZmIgur2SHGJ
	 2VmiZe6iub9TvE32oTer3V0ZDOqZxyEEwYVd5k5gf64TFUB9dWjx3/HOkqu0h7Kx/g
	 iiX/CXJHWsZ8TMzp1u/LZpLyE73G/91zUIjY6v3fJqALNCB1WKoBj5Uj7S8LVR0cLF
	 bjajcaCpeBl/g==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59e4989dacdso5230213e87.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 07:23:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVT3kVvijEEYUqnB6iFIpbi1/1+BeXxvj/s11LnHNB7MvFAqNtpwVSaTczxFOeHGrXeUcKRUaSgeGmJSk3EFgW7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/O1/PIownCwkHBHEeIXOYDEOlwMNgFRPISkmya4chNkGViImW
	p6zi0G+EOlJbVxEhSlsMxOJ/ViJ0pGoOxAmBrf+V8RpkjRyaZ0TZ39mky2x0Z4lw+B1DN+/gTO+
	T3uL9eeBM3u6pI+/nE6d8hSHm/rHThyE=
X-Received: by 2002:a05:6512:1589:b0:5a1:3f66:1d75 with SMTP id
 2adb3069b0e04-5a162b1feb3mr3926051e87.43.1773671023606; Mon, 16 Mar 2026
 07:23:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
In-Reply-To: <20260313195801.2043306-1-shenwei.wang@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 15:23:30 +0100
X-Gmail-Original-Message-ID: <CAD++jLkVZc7J+39eUtpWz4+YQm035HDtUyiyrEFGifQkcSMsCA@mail.gmail.com>
X-Gm-Features: AaiRm51oPQ0PGDQyh1c2t_SBzYfjFDmFeidRXonO75pnfFoM__wwYFbbiMK8ux8
Message-ID: <CAD++jLkVZc7J+39eUtpWz4+YQm035HDtUyiyrEFGifQkcSMsCA@mail.gmail.com>
Subject: Re: [PATCH v12 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, arnaud.pouliquen@foss.st.com, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shenwei,

On Fri, Mar 13, 2026 at 8:58=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com>=
 wrote:

> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.

I think v12 looks pretty good, if Arnaud gives his ACK on this patch
series I think it's ripe for merge.

Yours,
Linus Walleij
