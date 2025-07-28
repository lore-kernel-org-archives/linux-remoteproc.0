Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341AA2451C3;
	Mon, 28 Jul 2025 10:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753699051; cv=none; b=BFJNLEbakmJePAs5OlOExNSD/JA1ZWRrZ0Xn4bxmt4OjeiIyyi5iIMI0hcR9NHOCAat+zFL+Pz53RKGsHofL7SFeYg/wvYeSyGn95YhKJ4ZJ73GTaDdBY12hQk12k97rzWTgXfJzM2LGCSO57CbVOgA7EkVxGvBz/URpShYV/ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753699051; c=relaxed/simple;
	bh=7Is8XXTNOyILK+r8f7Gs6c1X78jzKDdIzy2diFsj8A8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fmJcnSDpRViLv2bhLhCGT9Crno2vXw2HF6TOuL9bCVh/F21YNN4LZ97UJvP9qarilws+/EMBJ7ipIIQZ9ZAvGhBxE+qLb+SAXBMe5h99HlCwBYwthoiDsnNA8a7fmDLkhOoY1YGpGBxidoYA1NEbduj6upnNxzIzljAyErjvSC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDJocPHw; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDJocPHw"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-24041a39005so2277205ad.2;
        Mon, 28 Jul 2025 03:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753699049; x=1754303849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Is8XXTNOyILK+r8f7Gs6c1X78jzKDdIzy2diFsj8A8=;
        b=SDJocPHwQ7d3VS4axyLgG3RQOhI+ZwoGyKawZ2ZDyVhWNGv0qDhfFN9EpCNeUV2OmV
         cYCma+y7bk1k/omwl1pnjw15hkBkVPdRuCd9XpmUzOAH4HSKVcYvrcM5ui/O9akyMCOb
         dTGxEI/XsTUZsCPgEebeRwfJ7v5lRz67P19FqQ8+lp74eAAxdqSqOzPMuZUghK3rMdJG
         fpQRTnwD8gya2fXD16ympOglh6Z9dsnUyqWZBvjEaKdgOQ39Ta73DiEwgZT5yrxqaoa2
         Q+KoGrgH+yBShizfo9yCayAg4xR3uzwGLXvvmmHy2XCiOQZ8lNcGiE8RIRiS+/6Y2XIQ
         d04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753699049; x=1754303849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Is8XXTNOyILK+r8f7Gs6c1X78jzKDdIzy2diFsj8A8=;
        b=czPkXQCB6E5/6A894MK+cLCkbXx1RS/r3m2QgK9G0T6iwrNnl87zg6eVoUXXB1c06m
         WMgx/bdWwAgsJLBVkfSwdaqM2N7egAflsTQ/lofancBY281cBUoH1faA53T1va/lWoR2
         BxXBAyxEl+WDcsjF9iEKWXoN7koXws5XeXssz6hfKvdJQGYsGe/mMN5+MmjINkRO607a
         mHsev7rJA44Hka7+Rx50SYnVdzJka8L6G1NLHRB+gUYxZONe0MmX4ZlzqhTSXMmb7RWN
         EZZ6+tvSTatIBfqI8X5seBRPjqPlmrjBqBuxhR/krKspvAAPg15m6FPND1Qy1vEu+vdH
         MZ0w==
X-Forwarded-Encrypted: i=1; AJvYcCU96xHk02bWeRXQ3u6i8s/pNOhX9Y0+hLH9d88R0P2wqk0JUjRFjr2E6kruOpuaPiuDlpzZbxyFkV6pYyn3suG1eA==@vger.kernel.org, AJvYcCXg6FkwTPsl/S2NZTmD8l52C2k3JYo2eetn1XFkB6hD21fgqJGCGSJFTsV8kN6Lnpt4PQHoflPZk6dZEDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjTNGX8nAJp08zjQzdV9H78i3eoy3xCH9sKsq4pa34/U+MmbG7
	WMbszuAJCgaNIgvBD82jwv9WWKfSdLoKpvnASsCjm5SokpDsnPB8hsEBMb+CBRB7DhzGQWECnp8
	H9wQYNqqbA37HA08QYg2tW9SyCeb5e04=
X-Gm-Gg: ASbGnct9Er3UXMy8Dk6fgSdjpfwCF/e9HitbJArdH/ky8BCCYPT6g9OBsTCQYSc7uc0
	CCZytxO0TUV52ytL5KASk7TE0DNCyob2tNJiT0u4mWVEEjG48IzdBf6tmq6qAEzN5MmY6svnf4O
	DpioNvpEKDX7KZiyk7Rs3HVm3eaCJYN34N4mYpYvItCdSYnvo8um0FyNZv9XGrgEc6ntbvUZHhq
	xu/
X-Google-Smtp-Source: AGHT+IF4QGVaLVSA5ClJtUhy2ZGKo+uZLc9uhqMBNSoOZOe2mbNHozP/VopVOfBiabKiy2Le+9KmLA59gGymrhaOPLc=
X-Received: by 2002:a17:903:2351:b0:234:f4da:7ecf with SMTP id
 d9443c01a7336-23fb307c7bemr126693305ad.8.1753699049378; Mon, 28 Jul 2025
 03:37:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722075225.544319-1-shengjiu.wang@nxp.com>
In-Reply-To: <20250722075225.544319-1-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 28 Jul 2025 13:39:38 +0300
X-Gm-Features: Ac12FXxqLG3fVa6F9gxX4BalbdOcd_A7WEBuWW7PtouWA-80m-MIDVezM3ly9Hs
Message-ID: <CAEnQRZBc2X6Yn0X+RbJ9-OSxovnHvoqJ3NXsJKBkuH82GNSAHA@mail.gmail.com>
Subject: Re: [PATCH v3] remoteproc: imx_dsp_rproc: Add support of recovery and
 coredump process
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 11:16=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.c=
om> wrote:
>
> When enabled FW recovery, but is broken because software reset is missed
> in this recovery flow. So move software reset from
> imx_dsp_runtime_resume() to .load() and clear memory before loading
> firmware to make recovery work.
>
> Add call rproc_coredump_set_elf_info() to initialize the elf info for
> coredump, otherwise coredump will report error "ELF class is not set".
>
> Fixes: ec0e5549f358 ("remoteproc: imx_dsp_rproc: Add remoteproc driver fo=
r DSP on i.MX")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Changes looks good to me:

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

I've tested it with Zephyr synchronization samples inducing a crash
via debugfs interface. App
can recover correctly.
