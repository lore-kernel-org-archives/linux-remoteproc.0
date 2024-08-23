Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DC955E58;
	Fri, 23 Aug 2024 08:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724400642; cv=none; b=B7h1seaYQo1wZsxMYaKVs/QPDKb21Y6W2hD9QODhXnJ2f5//4OJP7xsydj1iZjyaI+hiDSgkwdXUU5LH9NJGqi88Oa/CW7/kn8NJ58S8P1PGle7TEDgW8t25QSrWbwUxQpR1vYB4vEwXghkyQA9v3HXsoGh6vqJZiisd6r5KFE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724400642; c=relaxed/simple;
	bh=cs2QYizPtyqt7HMTt9QPD4aL4X+QFKO9Zb9ikILmneg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AOpsMc4CRyJbVSSEphMYPtQGKqbgVBfYX6xqIMNklS6Wjhc7luTjlH3QPhgqaB4sU5wKy8YcH3ARtOR5pLcEZr7SKR5WY2p9B8X+HrA+kEjdX30Gc0PP+6CZnt1maa7wsPWrmMIbiyzkyWaGHKyqNawV7fiharfe1HCLKkFEX8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OC2wfske; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OC2wfske"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5bf0261f162so2348897a12.0;
        Fri, 23 Aug 2024 01:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724400638; x=1725005438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cs2QYizPtyqt7HMTt9QPD4aL4X+QFKO9Zb9ikILmneg=;
        b=OC2wfskegdeZPAZj708g9HR5iagwZzfWS4rkjQ3hl8wLBhpuFQKB/9i0Zgs9ixBDMF
         pVWounPSgKXLx6YigYC4lef6VPAetuDAR3Y2kE7MzWdyqrdOgCIyVuBBNwOKR7RRSeMt
         IKu4wYNTrMZ/0g5SfkJ8QQ8St3iH0OeBAsVHpxtkFtTnUxy3SMt8rF6JXHxtCsgYWT0c
         /TyMO1yVU0Z6NGh084bDGMESzMyaATtvdvPXmHw6945j/oBR3K0C5h0k+L161pr0+7bR
         qFcXt8RL4u81OMP7fpVIAAC/B6JCzgkeAW715SNB/FxyVJ5B45O2X7b4usbmhNcXe5+X
         zqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724400638; x=1725005438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cs2QYizPtyqt7HMTt9QPD4aL4X+QFKO9Zb9ikILmneg=;
        b=CwERXpYt/Xnoniiiifx2UaE85C7cbsw4sxqKNzwHYh9lZz8CLho6aouNKM+9rlHnsj
         uoed9hdmCeJ96Vx5p5yY+LWRc5AyJ7nDCTiPWs8D0/2X1sgcujio38cTvrBzp/AYZDnw
         6jtQWbIlrVhzY5ZxxnKSeTSDYtppFhneo8i/00TLOetnh3FygtzRKuoUCU388DmRqlUz
         sGVpo/Lc86h9BZcTTm8Q66LVBWdzoqbwniCMnoICU67zm49furzzUdrY3FxtkS8TYe1P
         LmZJWCwbMxV8OHizPQc63xlHZXf/mwDFmiQRR8bu2Haqqql04dm8O7DW+2Rxlp0SQuMS
         BaDA==
X-Forwarded-Encrypted: i=1; AJvYcCUmCQ75mBpLBD+ZI9zjR0on0WUAxTgOejaunBjKFzckKFuMbreR/MhYv+u/Ls0RC3z0dpqpFZsa/o2eCKfS1x9Pag==@vger.kernel.org, AJvYcCXOY8eCpgL0JHTZAdhdJxhqx7+8/159O3dWu1Liii2Em/eXqXD7Fe6WO6HFQQW0Ng63n5mYCP24fofafhI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp8vWiPKCMo/y1/0kg077Nsxsc8a8r/idtQMxtvdVYYKNeEFBR
	MpZObzu6sksu91/qiWaB2L4FnHBM9CzLsmNFxBFwck45Obai5zXOH12owlQPY1dQ84nq0fM9uJ6
	tRFLjyNiqAt68c0hWhx+hSP1oggs=
X-Google-Smtp-Source: AGHT+IG3ViC3jHroGnJCgE2MvepgrkcPC/GRg0n/+FheZOu30c6Msim4Mb2TCl9/8TIYixC3D5issGRzFrLe8DsEk6U=
X-Received: by 2002:a05:6402:1e8d:b0:5be:fe84:cc4f with SMTP id
 4fb4d7f45d1cf-5c0891a16bemr662259a12.29.1724400637640; Fri, 23 Aug 2024
 01:10:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822-imx_rproc-v3-0-6d943723945d@nxp.com> <20240822-imx_rproc-v3-1-6d943723945d@nxp.com>
In-Reply-To: <20240822-imx_rproc-v3-1-6d943723945d@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 23 Aug 2024 11:11:26 +0300
Message-ID: <CAEnQRZC7xECmHm072uENwUiGJYspBwpc4_xORcDUdRPYadgtgw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] remoteproc: imx_rproc: Allow setting of the
 mailbox transmit mode
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

On Thu, Aug 22, 2024 at 4:40=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Current mailbox is blocking by default, but there are cases where we don'=
t
> need to wait for a response.
>
> Linux just needs to send data to the remote processor, so let's
> allow tx_block mode to be set (true/false) depending on usecase.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
