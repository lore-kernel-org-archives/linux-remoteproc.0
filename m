Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A16301472
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Oct 2025 08:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761120607; cv=none; b=shC+fSiYmm3YllBl15Zb8aHJ48fRe58PSy9HdH0eW9oNE0E/fxeFscs5KKVCutTgQgvN/SVetgVd+2tWVH4poi1k/QWh5eFSYyRGtGvvGXzvKRzLCIJ8ii58Y9i+mty/xmUEYlZEFpzztix4d3vL0QIHrOXof4IAAjXOqrOodeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761120607; c=relaxed/simple;
	bh=HEmnc5vMpi6b1OrbGAVQUc2U3zcPJKxRDOHC8XlWCio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WYwKY1a7KuSk5TEKbufOvx6ervZaK+CiRQpJTzPCZVwhRXNYKyTvsKXBCi2f2JuF6ZhM2tIIZZ3Gq+tNtSUiFVP2yKlV2WCISodJWG75a8CzZ1+vROQGRJ59gvTji0CY7KoHZ65+MmX3BXRya2dCMUuBbznDJjQj25eDPx8I0Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H72RrC4G; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H72RrC4G"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7811fa91774so5849899b3a.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Oct 2025 01:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761120605; x=1761725405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEmnc5vMpi6b1OrbGAVQUc2U3zcPJKxRDOHC8XlWCio=;
        b=H72RrC4G1ZyL6HkBKn5H5MiTU24BAYiXNSj7UaKbU5Qn6unJirhgm/Vf86BWAOAvh4
         nNiaZ+aoAmJdJ6SNJadjoZ4IgoyDOdVMGPGlLX+y4IVbqOZqKsM+5iQCNjmgXsHfj4eI
         0+eTu2MJOVYQANHE5w2jgA6eg+dulDmuq1LV3dR/EDEiRwQZ7rseEWyu7J2xH0BdlsqY
         H1LmEm+A9kf5NP+VjZXhsqWL7PZgKH9iDb5HSxlNzS1zaNGZa8t3V9/H2OFFYtxWUB8A
         L82KHnb5Q/AGAYkJ5yvPMF+QDvunfJP1jSbIOgncYwHv8kOB/qfVhvogxKrG0hdvgMjr
         bqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761120605; x=1761725405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HEmnc5vMpi6b1OrbGAVQUc2U3zcPJKxRDOHC8XlWCio=;
        b=VncxXvaudYWcpxdSGKHTEFXcIX5ok2jOqTKV+RzqvtiwrLVWsmknbR7HBsVXLNEfqU
         Cr/1PZ5gKapHAjGfOIv13dtDek7m1ibW9MrNf6Y/1TsO/Upv3KnbMF6dKXuWZ3JrNrXh
         rG8Oi6mjAx6V4djPnVL5DjJqHeZDow9M04fo3eYXzfxZbHQ1pR4Rt0ZF33kytZuLiP4h
         nfsQB3CdnA/b8NOHDMQ8iSxH0QMk+o3zNp30xKDMV4Dq6Fu4oKE3DLjV1rmePHdUQcnM
         XLijSmG34lU/K/IMx6LdxSxCroY+Ywrtt6HFJ5V2anEX2+g0ofQhRJLrgQp7+Sxa0iLd
         Ey8w==
X-Forwarded-Encrypted: i=1; AJvYcCVSOkT97kLIIQkj0XFWJOA6cQo7dN1PUbJ+r9RMK2hKIQUKbooUQvETAzsUVuna2czefDSKkDmAq8DNk8SoISOr@vger.kernel.org
X-Gm-Message-State: AOJu0YwYepwQTob64PnkuTdMzHkYECYxUlf6H6de5FMVhlKwjBq5fBIg
	Gc9mKUHIrl1M0n0xGlTlDGIaqZnSgnurHV9M5ySYfB1/oHMbC7EQoF3Maa7bHD5wvVq1GAZpx6q
	mU9S+7gz9Iux/e5cxi4cPKCvJlDMkDBY=
X-Gm-Gg: ASbGnct/56RW/t/yPLDq8TJ8MCR69tsvYgvyjC7LrZJPrGVSbkvmaG8Bo3hTs/JJsGh
	3OQjGeZd4aZ4NXlqxcGDJCVEOzjPc/NImr5HfeqE3EKQrrc1pVqdMMd2kBm61hXY7pT+hdTWUpX
	2Avi4jSz+iRX7QtbgwlXtf1SKYvdyQZkKRmLOpBS1iEjHGkce4F5K/Pkpmssm6pot0ELNmNm173
	l2E5ptGwgmvqEm5RzEZShJf39mYJdlCqDBLLfAzEYH9w5aX4aqdthx6ssqcHIziqCT94GwPODve
	HDt+KYcQ5YXsxw==
X-Google-Smtp-Source: AGHT+IFsRa3NbzwE1QRZLbALMdXqpaiYhoZrvFInF0ZoI78jJyRZgIJgbztvKnV2w5sJzHcRyU/kiI/2UoR7hH/UHaU=
X-Received: by 2002:a17:90a:ec8b:b0:32e:d011:ea0f with SMTP id
 98e67ed59e1d1-33bcf8f7280mr23198312a91.25.1761120604592; Wed, 22 Oct 2025
 01:10:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com> <20251015-imx-rproc-c3_1-v3-3-b4baa247358d@nxp.com>
In-Reply-To: <20251015-imx-rproc-c3_1-v3-3-b4baa247358d@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 22 Oct 2025 11:12:23 +0300
X-Gm-Features: AS18NWCHR6zWPh0Lhyj7NW_5VyV1sIwtSk-03hUxmGwwLIGzWZKXfT3yeFbQvzs
Message-ID: <CAEnQRZCtffKGvAUdB4T4RdRDP7VBV3Nt=xWZBXNtRzxedd73Hw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] remoteproc: imx_rproc: Enable PM runtime support unconditionally
To: Peng Fan <peng.fan@nxp.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Frank Li <frank.li@nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 4:54=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> PM runtime support is safe and applicable across all i.MX platforms, not
> just those using the SCU API. Remove the conditional check and enable PM
> runtime unconditionally to simplify the code and ensure consistent power
> management behavior.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

Thanks Peng. Makes sense.
