Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5856778C76;
	Fri, 19 Jul 2024 08:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721378854; cv=none; b=TgrMTRXfFwAYihbmmWt+a9k6xPRtLxQwbT+b9GVwdaT64L6Bi5A108YAy4odkTUY38z7FSM80SZqDeVw//0tRfjzKHqw4xpda63Y1Qbsr11/cbVcrwzdbXquqNsteDyncMsgY3u8QzGrSLSLIBz9DChPYh9aKGA4ndn3U/SKigc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721378854; c=relaxed/simple;
	bh=Q6j0m/GV024tPr9HBEbAXHZCqMEuvAz0pcHffhTEQMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bGXQx/QKrcQTBjeqiYECJpMYgwW1Zij2YoAc2sxnLhZIZQTk/K/B++alXZE5H/HCxJta6sCNR0tYZwUb28xEqUaD1Xg3D13Npsv1ygWNA94/Hmf1t1hWoONt6HGHLV51RcwCIJIfGnCxpa294XlBM68SDYKJwMLQOZgPZxt04UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dh9mDPqY; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dh9mDPqY"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52e9b9fb3dcso1462061e87.1;
        Fri, 19 Jul 2024 01:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721378849; x=1721983649; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6j0m/GV024tPr9HBEbAXHZCqMEuvAz0pcHffhTEQMs=;
        b=dh9mDPqYGvHF0a/mxkI+Hkny6AyqnQbGTrO6QMts488iKKjFK5HHxdGeEIxsrIpE++
         KTWpS0+MWyIW0XXi344Ysk61E1cSEcgDU5xoG4+JWm2SvU6SbwZsbfXkaZEzgMxMtome
         A1g71YeAhYGrUIoDup2PJNYpYL5A8st815vYHuJWE4/TvMYZ/z0Ju1gpnmNoutAYksdS
         IGFNmBkUdM3qd4JxVunV0e7t0EFdhHO85p6mkyVdFW5+yPgoo5+BU+xdIwbS2NG7ArIQ
         F30jarHMt3Zqz50MKO4SW4j+0gnraPch2LzOSqtce1umqWG9KEGXCxTOUvOUgWI1M7dL
         qBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721378849; x=1721983649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6j0m/GV024tPr9HBEbAXHZCqMEuvAz0pcHffhTEQMs=;
        b=AGtBX5KAtDaRFC7/2de40OH6t7/f8I8mWOHsLnVxHBZBKBvAoOSu2cQWw2qqN2g0wM
         FTUI62+UyAnh+JAQMUsW9kZs763S2ylvnKD1gsmLMNUNmmjDxH/F3O95ZdsZI3FICXd7
         VqIHuu5urY1vxyCLs9rAZUDmxdyWtRCubas+2MqNhpg3sTYIC3zIpaP76zG48SXSxIpG
         9UlrRro/RwZlUwHNCe1sWsPw2uWa1Cndo0BxYcCtbQIOV6UdvIa9iQwO+TNC2CInJoWJ
         daafk+4Cz4GDPBDytFo3Cw6DllJGHRSzl9rjAXzrR3CQOl1Ccje++Ab6T7S2TRkLKCb7
         Lm8w==
X-Forwarded-Encrypted: i=1; AJvYcCXiekLr7uoYx0NH5D+XnPXSCFu9kmO2e4AXLjiknWeV7x8OR3Is7AJIe0Q9VOmqJd/q4sEKmtAVmpJ0ggbwGYmi4kn2wmzOo7hh+pl2K8BCrBpW1k51651GzUyQhs8QM9RXUqBNXqRlqjnM3S/zeg==
X-Gm-Message-State: AOJu0Yx46wd2aphnCQ0RNOazjCa+C5uSNv/rQd0oy6R3v35NY+cB3/84
	bMaE9ejyE3ZsZdkMxxLbIl+hV/l3Sc6bX8lqg6El8TgbkDzWCbwRkuJlcFGu8skLOcaRSUuBs2q
	zta6f3jyogBmOa59pR33g2yY2nJ8=
X-Google-Smtp-Source: AGHT+IF6oxl0sIj4f5dI1xPZ8i0jbh47IA+Yb9zWXLd3oU6mZBA4Dz5cL+FGoB48prP+Tte24qxe1YGA8xMINVBUmKc=
X-Received: by 2002:a05:6512:b22:b0:52c:e1e1:ae91 with SMTP id
 2adb3069b0e04-52ee539c92emr5555209e87.11.1721378848854; Fri, 19 Jul 2024
 01:47:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240719-imx_rproc-v2-0-cd8549aa3f1f@nxp.com>
In-Reply-To: <20240719-imx_rproc-v2-0-cd8549aa3f1f@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 19 Jul 2024 11:48:12 +0300
Message-ID: <CAEnQRZDCMDZ=1hXSfGzAkz5kxL_xYo+fZXMmMQ_ytywRKRd0Hw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] remoteproc: imx_rproc: support non-blocking tx for i.MX7ULP
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	Marek Vasut <marex@denx.de>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2024 at 11:40=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:
>
> The i.MX7ULP Cortex-A7 is under control of Cortex-M4. The i.MX7ULP Linux
> poweroff and restart rely on rpmsg driver to send a message to Cortex-M4
> firmware. Then Cortex-A7 could poweroff or restart by Cortex-M4 to
> configure the i.MX7ULP power controller properly.
>
> However the reboot and restart kernel common code use atomic notifier,
> so with blocking tx mailbox will trigger kernel dump, because of
> blocking mailbox will use wait_for_completion_timeout. In such case,
> linux no need to wait for completion.
>
> patch 1 is to support non-blocking tx mailbox channel
> patch 2 is to switch to non-blocking tx for system poweroff or restart.
>
> Based on patchset:
> https://lore.kernel.org/all/20240719-imx_rproc-v2-0-10d0268c7eb1@nxp.com/
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Series looks good to me.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
