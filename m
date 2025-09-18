Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1A326D4DA
	for <linux-remoteproc@vger.kernel.org>; Thu, 18 Sep 2025 06:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758177708; cv=none; b=lHACeQq+EfunnphAM3S7xGaCQNdys31ASaZzqOjtE7YkGYIRYMJPB5oBk+yCyx5yDfsR5eM1gQ9kynfW2GIG66y+mIeVYY6RVStkKdQavkp3FYUsPLw14fhjKaRV8LkD07a6fb1JbIJRn6oSjF4wIz9fCi9loPldkK8XAgwKQEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758177708; c=relaxed/simple;
	bh=uhTbUPVJFOyAmNdzQk98ubzkzQEcGMZ5ZsZfB0f+IFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WCCEZX1WUVFOz4KlCnntAO6qTd5G0LVzIQsRUAJXAOErU5EmcVICSd/SWbD4pzht61jbKnhrW5wMi2MyPjnput07qKGrBCHFrutTqFEV+HDHW3KS0YcIjAB5pKFxzde97f8XwEDJvXF1QxKt7Z/S1QZVjD+xkJTv+4KhaOtOx0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ASTpu7rd; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASTpu7rd"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b54ff31192aso404304a12.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Sep 2025 23:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758177706; x=1758782506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhTbUPVJFOyAmNdzQk98ubzkzQEcGMZ5ZsZfB0f+IFw=;
        b=ASTpu7rdhCzP6+DTIhJjKumYJptkqFUiG9vq8gUICQ+ro6fxWhT9Ehcf2na8Z5d32Y
         PU29NMy3wMfLnC3wjGz8ukf3er6mxSKO27O7/ZjJ591pQZix9RfcIIpudmMYXHtd34/T
         YnMkgY5XDqFX4QnJRrriSnxG3LY8LIjFulI8csJAJ3Ty10dAOcAIIPIG4pLe8rljmCO3
         W6zIVPTuuhlSZyGEBPDv+XTawGAk25gG+/gb8nOAgXVyauRijMxiI0V2HK159xMuonBP
         rZ8quD1wSjtvEqM5ZyVD8M4I60cjINogwcbHvDZVz0Nkb7IMgw54bQwqSWwfs9nnIywQ
         Wwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758177706; x=1758782506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhTbUPVJFOyAmNdzQk98ubzkzQEcGMZ5ZsZfB0f+IFw=;
        b=nxjs6TV7TnMEjj7bh+RIkT0KgUe/aQrYql+eGqnyPV4mtXoD7zZayRZUPU/32+9nsO
         +wk/12g5Ws+/nv1JEvypEgBD1Fybx08jG4LJibWzWyaMWpt0ctTeciZm0244oxbk+IKA
         UgqbefL82REcrSzLGe82S3pZ61Bu8whjjlCaMpVeYG8oa/MqYjrZG0+T+sox/a/DYsy2
         WgubSpdzcbU2HfPoNQIqKf/yhL3geV7J+xMEla7kl92CCM2N/CklJExspKIp1pjCRbiU
         1CbsVVPDvwsmoZnl+CINd8I6KrK+SUpvbN4edmtjkUSWdPRBgKQCHDhTiW1/Q+TxtXlg
         MfAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl71+zlR2T7qiRdeMHtoBthBW53o2nzXrSs5nlqEZKptAG84v1jHG7kulCMK+gCZz+CfPagicWSNSNt6ed6fm9@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxcb8ng5Y++zNfix8n7iksRNqct2KEM1Zb85vqzGD6UbP/CUmo
	iYI3IQGid37QCxYGjIVTGcDgw/5fusK8W9pgbglqlwqHzixKNciwvbBCevEX0azYRzbpaBLu6GZ
	DxA+Y/VV9LWkKxSYpfnxH772ZkwaBakk=
X-Gm-Gg: ASbGncuExZuO+Y8ASkPW1GE3X+PFoa5JE1dSWOyl2TN+1CdW5LOeomRzzhwO/Za2TEt
	EvXTo5X3i7uuoNfV9yigorL4nNWbIKeUysYD5FAnCSRzfmadrDO7REyqrqi93CqnOlbeCU+pv8x
	rFv00aYVDFWh82PdyMZMKJxr7RkSu9uB1FciTuF0qEyZczI2v2u9vXpqEDe9eSut/hyS1wxEWYO
	P3rVTiE6toCrtOV3kxOEfi8XBiqMMgSrLVZqbJmoCimAR+7/tJAj1I=
X-Google-Smtp-Source: AGHT+IEr8P+L0TJR3342JH9xYHQV3+Q0WGlxdbCLJmGp2Q+KPgwKRAcFBDBLv1ory2mNLCloivvxGbpVxzz0t7SLcf4=
X-Received: by 2002:a17:902:8f8a:b0:248:ff5a:b768 with SMTP id
 d9443c01a7336-26811ba5363mr43004575ad.10.1758177706285; Wed, 17 Sep 2025
 23:41:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
In-Reply-To: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 18 Sep 2025 09:43:52 +0300
X-Gm-Features: AS18NWCPevQZqr-17ld4WpzvBigiHU7qwZn_PzyMsJ9Y7iuvJrnxcIFdLFQmdb8
Message-ID: <CAEnQRZD=1hxMmR98qfpoH_RFFrSrYMQ6ithFkjyqVgtqWKB_+Q@mail.gmail.com>
Subject: Re: [PATCH 0/6] remoteproc: imx_rproc: Use device managed API to
 clean up the driver
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Hiago De Franco <hiago.franco@toradex.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 4:33=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> This is the 2nd series to cleanup the driver.
>
> Patch 1:
> Fix the runtime usage. This is not critical bug fix, so it could be
> defered to 6.18.
>
> Patch 2-6:
> Use devres managed API to cleanup the error handling path and remove path=
.
>
> Tested on
> i.MX8MP-EVK, i.MX8MM-EVK, i.MX93-11x11-EVK, i.MX8QXP-MEK, and i.MX8ULP-EV=
K.
>
> There is still a 3rd patchset to do further cleanup. After this patchset
> get reviewed, the 3rd patchset will be posted out to list.
>
> Thanks to Daniel and Frank for the internal reviewing.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

For the entire patchseries:

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
