Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8BB2561C2
	for <linux-remoteproc@vger.kernel.org>; Thu, 24 Jul 2025 09:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753350601; cv=none; b=tacLDRBQpOQBLEwtUcsq9VpISzL3E9U5+CvuS0PGl0YhxV5crNnScDJ2sOaxkmICobj4O5E2JWleTdpkueru9GW4sMaf12L0nWPcxdUrXIlOzmeiKsw5SFNqVEzobSbnKHOdeWaUSYWR3p87NwA8DT0IoKbPHQaJFyr8gWlvlOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753350601; c=relaxed/simple;
	bh=+1yeaes/5WO9C98Ce+RQRl+sqAXx+8dUlJLLdWKreso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H6PNU3UbQqGWbgfFlmN4yXoFvMiOQ6ifbfNVuYb69FI6FehtN/JyypcsiGmmOuB445yFVDs6qlFpQZeNnmqQxSYdYf39QnhFvgXQmzmQ9qpoIiVmYPXQiilbT7Z7FBeTeDBuoTDAZkx5z/N/68oDhN2Y44p3hJZzkFxdIo3O6Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Sx/xulJh; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Sx/xulJh"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-556373661aaso697554e87.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Jul 2025 02:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753350598; x=1753955398; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1yeaes/5WO9C98Ce+RQRl+sqAXx+8dUlJLLdWKreso=;
        b=Sx/xulJhXt296mnd751zlozvO9hmHj6VxjVSAz8m6yTaPTLv9QBPC0UptAjx0eFuVc
         XmD/9IGcm1tSFFDgNReWTVEZf+hA+8drt6emVomXJ7FjbsSwi83t3hHFemM7lEdWVSOt
         sB/lZmGDjPF0DhLo9GZr1YyTbyTdsnurUXtf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753350598; x=1753955398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1yeaes/5WO9C98Ce+RQRl+sqAXx+8dUlJLLdWKreso=;
        b=AqKXrhXbSKZiybVQaSVE9IfMyKOs2Cq2SLa0MmFbsIm4jJbeZqYrMvB8CLzu484nOb
         z01/lV9jynM1Gpk7Mm/enYALeyry12IqgN+jQUKLaizFV0oxxRinltg7jR9V6LXXXog9
         wDA6VNGU/+Egc61mLffq4cJw+sUOW0JuHui250ypS+kXNVk9nX7dYFlzCIW5EbPA//cw
         3xWLgsz+mlMQ03haby4w5weMRvAztgY1MpYRaUWgQh64PuBWvyOOrGwkRuSK2P8hU9F9
         8e15/ziFpZgdEROjZp16bFUK4tUfYPH/+F7/QBWbPjMYeGn9wBKxDezc+YFMxwdn8m+C
         v5FA==
X-Forwarded-Encrypted: i=1; AJvYcCWTuOGWwAiC8dR2V01iKEof56og3N0MlGPFnF1aPFCPQEVaN1zXCqbSf01MG3+cy17FWRT0bZfI47W6gioLNB8Q@vger.kernel.org
X-Gm-Message-State: AOJu0YykOticyPgRZZatJQMkQVTQ6iqI2sN2EeO9ygAF2taDe4nwjiaV
	C08oAa5aP7ypPA+z1bF3RCqrgB56+M2gxsdJ3TETsEd/hymNX8dbZlErx4IlcvkqNBkctkfZaC4
	U9mGwLFpKZFGsmQvejnz6epeLUyqzjly9QUnkm3ZN
X-Gm-Gg: ASbGncu5+/3sJRrgweTZ3PpXQYnRXNwSHJOTB7sXZJ0seP6jLufJU+PMDYz0+3MWGqc
	3kUvsbe23WGAYxdnYJb0Mp9NNOTkvBwvH+I6eG9K1Tc5xN1e/WG4Z3UCMbr9A9kvbIeeDqOfWAT
	BHYxOWnS1NG25flD/1pLROuJJBa+ITGywT7GiDViATUkDzCV0F/OaYl2MHDG6nvUiZyIyfVY9Zb
	39qWMNZRQWKu6ljiGMIcUJcPv1XxQqoZW4=
X-Google-Smtp-Source: AGHT+IGItj9eON5joXD9a2IIIdgBC35OTh38AkPzmXEBTTEZMPnEPcqJK3Z5OhBEkyMLKp8WCCWs6kzvOlePUXbqfGg=
X-Received: by 2002:a05:6512:239d:b0:553:2dce:3ab2 with SMTP id
 2adb3069b0e04-55a51354ddbmr1925545e87.6.1753350598082; Thu, 24 Jul 2025
 02:49:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Jul 2025 17:49:46 +0800
X-Gm-Features: Ac12FXyptxSYdnZvhVmVzcLhUSOXFaRzx8la2O9AgbSx3nJkJt7JLwM6IxluTrU
Message-ID: <CAGXv+5FWV+RtWUJW=e5pJKiSpeK57fHpTrst38bN=1OSgf6P9Q@mail.gmail.com>
Subject: Re: [PATCH 03/38] dt-bindings: mailbox: mediatek, gce-mailbox: Make
 clock-names optional
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org, 
	conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com, 
	mchehab@kernel.org, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com, 
	vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org, 
	linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, 
	tglx@linutronix.de, atenart@kernel.org, jitao.shi@mediatek.com, 
	ck.hu@mediatek.com, houlong.wei@mediatek.com, 
	kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com, 
	tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, shane.chien@mediatek.com, 
	olivia.wen@mediatek.com, granquet@baylibre.com, eugen.hristev@linaro.org, 
	arnd@arndb.de, sam.shih@mediatek.com, jieyy.yang@mediatek.com, 
	frank-w@public-files.de, mwalle@kernel.org, fparent@baylibre.com, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 4:39=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The GCE Mailbox needs only one clock and the clock-names can be
> used only by the driver (which, for instance, does not use it),
> and this is true for all of the currently supported MediaTek SoCs.
>
> Stop requiring to specify clock-names on all non-MT8195 GCEs.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

BTW, I see that the cmdq driver has support for sub-nodes which was never
actually used, possibly originally intended for the MT8188.
