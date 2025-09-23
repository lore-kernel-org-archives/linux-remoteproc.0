Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9D926CE15
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Sep 2025 05:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758604948; cv=none; b=RoTa8F6wtxdLMewOzBzaTl/KnqRmN0Jfi4eqnRGqfIWLPeKG4Sp//fZK91HKBO+374DDp4UzNzqKOmH6YTPRz5N0cmTUeUvQq1kn1x4YZi6KV02WjIg1ev8AyiW/wJBkEcpBW6YTlgyH8AMjkE5M6PdfBwFL10c5AzMsIqpFZqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758604948; c=relaxed/simple;
	bh=lGHX5iqtB9RFLRtL8dGgqDLJYcyVFasgYEy9aB83oIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lU698lBlmB0IK6Xix6nIgzSkuxmebhWiAB8y5sE1oNcw36ojeZjOlb8MP+6He90QdUpFFdAxry2mhKGAiZ2KhWryltPrQ+9WqfG3KGWg3+hd4tbqCv0peQhMXGV2jUYrcDMeW2Vt2tHLaJ5bXeOjlu1HSd0TrVKiRQqONyizXiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0sZbfYB; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0sZbfYB"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-32df5cae0b1so5816855a91.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Sep 2025 22:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758604946; x=1759209746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dmt/sXOh8gCfdLN/NRWF2le0DpBMuP58ZmmKHufhPw=;
        b=f0sZbfYBjf6e6NQgv8F16fBNLIMk0ake5l6VmvVXgvNfoc5G7pcl2oOOrWLZIOom98
         lekmfpEAECpyrZxY+djxJDRmxqINi+R5heIQ1h+v+NOoJwiC5WQ7I1r1VEwFlGeELCt2
         QXqSz0sEX1hi88XbAFpg75cz81Sd7dLCkeJM2o3XD/fhdChPOUN22ogIxTZQ1GUkKlAh
         Vdo7cuuAzXWRLwvQMDpWhKt8ivmjrw8YOVKKhZD240Wp8D1EehEyShJTknz8vMQwlv5T
         MmymV0JTDqlVHomCbpgASU6447jPzM7OyXcasRBnBesCaPpsyX/NBuSx0Ifx0qwsSiZr
         L2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758604946; x=1759209746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dmt/sXOh8gCfdLN/NRWF2le0DpBMuP58ZmmKHufhPw=;
        b=NumkMRd/zUtazyUzc+SEDKzZUd+pEcwjBeSVU0uWZg3pw35KWZ+OOH1CmVrt0IEHNj
         tEJWIao7fen2YJkQR2YLH39vDajWqsJQXTvuWWKWfiKTqihqjTjLGn31nq6OdInmWufW
         GDn6fJiLwtq1YMwrlp5McsbnXQ8V88HEcRwsn3+KeyxCDdIwRT3Z6nyiqaFJLGt0Px2I
         tHRVVWSND5LdA6ZZwqnX5Q/Ve3Uh26ductjXOteXzN6oWOhou2giZcGXLY3/SD5XnVQp
         G6wbUuTEK8SdsWvKE2TdFrpRUJSKjz1UShJc9JOO0ekgn2P0W2uG7qQJd3N+7+wH6YkY
         adaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnWxLsRXVwqeq53AfNGZX+kGtHltfDcXChW/zNOTChi3WMTHL6823szyt2xVSnT9VdLUzuRk4BIJF6Lvr1PN6O@vger.kernel.org
X-Gm-Message-State: AOJu0YzptKf7lmGpCJAJnYdrhVAujhjxEJDsgJVyXv1ug73x2oJLUGEI
	jCexHdqAjBmi9QpDABx0I1OsCB4Fm41NLOllfYB8Zg6q/y9iObaPqWMLB4HEKwGfyt5F1RM+JmB
	aZDSrdK/VarEteGI9wKkD4wPjDrS0PPU=
X-Gm-Gg: ASbGnctk2ISdYO5Nobu4OtQgqgJhUYQsmdpa8/G2A2t7wIkmWntp8mW5EP6UIiMFN0W
	/ftS1IY5ROLhGrHo4T9f6GQXJeU+H2NJFWEGLlUxMk2ta1TQYAxbv09vf+ZQIEZuJAC06gTr0tz
	EsvC6Qso6ICHO3+S+lTnYTnqpbKTQCW/F0cS34QBEAwWRRfrXQUbWhEv13DXjN0mwqWKjYdSxBU
	vsKhiw=
X-Google-Smtp-Source: AGHT+IHjWF0OdvwVEBZ2nx87jdr7LoutqHAGG2hOFlgZ3AbCfU9cADrnOPszTGryVxRnY5J5JPGYaDNmdz6D3L0+UhQ=
X-Received: by 2002:a17:90b:3d0b:b0:32e:18b2:5a45 with SMTP id
 98e67ed59e1d1-332a92decfcmr1741778a91.5.1758604946515; Mon, 22 Sep 2025
 22:22:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250920-imx_rproc_c2-v2-0-3351c4c96df5@nxp.com> <20250920-imx_rproc_c2-v2-5-3351c4c96df5@nxp.com>
In-Reply-To: <20250920-imx_rproc_c2-v2-5-3351c4c96df5@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 23 Sep 2025 13:22:12 +0800
X-Gm-Features: AS18NWCk-cLOeEky62DrDgsGiwmbzQDyczljQVACaIeDqm4vgeh4qeeeuazbSbY
Message-ID: <CAA+D8APwkqsAEz=xgaZ9h_4NbFemMoACEJ=xXjVkGhd4mTxmEg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] MAINTAINERS: Add an entry for i.MX remoteproc driver
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 20, 2025 at 9:16=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> Add an entry for the i.MX remoteproc driver
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Acked-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Best regards
Shengjiu wang
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index df319f9762b369a2746ee7f41334be9b57e7bf9b..c25aad1ad4386623065058d1a=
7cf92e1555ec7fe 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18508,6 +18508,15 @@ F:     Documentation/devicetree/bindings/clock/*=
imx*
>  F:     drivers/clk/imx/
>  F:     include/dt-bindings/clock/*imx*
>
> +NXP i.MX REMOTEPROC DRIVERS
> +M:     Peng Fan <peng.fan@nxp.com>
> +M:     Daniel Baluta <daniel.baluta@nxp.com>
> +M:     Shengjiu Wang <shengjiu.wang@nxp.com>
> +L:     linux-remoteproc@vger.kernel.org
> +L:     imx@lists.linux.dev
> +S:     Maintained
> +F:     drivers/remoteproc/imx*
> +
>  NXP NETC TIMER PTP CLOCK DRIVER
>  M:     Wei Fang <wei.fang@nxp.com>
>  M:     Clark Wang <xiaoning.wang@nxp.com>
>
> --
> 2.37.1
>
>
