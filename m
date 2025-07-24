Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CA8259CA9
	for <linux-remoteproc@vger.kernel.org>; Thu, 24 Jul 2025 09:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753348626; cv=none; b=jsp/qakZxBGyFIaqzJxUUQpHAMQ9a4846V08dKMRl5xGREkx07gPzBRP6eFChf3rseq+P6S5c6k6ZQLx5bFIhOFQ2SbIJKUhEs1DBhD49jD0/Y2p77nHazvyeCh4CVWvyOjxUOTVKocAaQ9oV47+W0RNHbAQQsKGMGZYEQtiIoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753348626; c=relaxed/simple;
	bh=PzAImXvw7ltOkAeF9aE1vYSBycD64FXcVdqDkDZASUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VjZ0Cs9FKFD3eBulNlMV9zO3XgxYny5Vql9kCCNjrToZQasj8vYjBOfjhHt6iel03c8JKDgR0GiOfLS6L9kIUpXU2yaYkva8TqW5k5mMFDjkaoQyh831654g4xLO7HaS5WWdTe3ivmEUI0hArxWMcYl5WVEGx6iSax9m6F+zE6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CfDQOpDG; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CfDQOpDG"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553d771435fso825518e87.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Jul 2025 02:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753348623; x=1753953423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzAImXvw7ltOkAeF9aE1vYSBycD64FXcVdqDkDZASUk=;
        b=CfDQOpDG7+H+rT4gcjxVG7nzL72tk82jIG1UHBBO6Be6KGFhDBbZJ8nSvH5RpDu+4W
         PhPhs0uFjfTJfcg3Dd/GGYRXi+YHgjZedHEcOGMbkyqaB14T4bCyZ+c26Ve1RhBXkzNJ
         Shk5METhMqgYWQyIaU1Eg7XI8HUByzQshRM18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753348623; x=1753953423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzAImXvw7ltOkAeF9aE1vYSBycD64FXcVdqDkDZASUk=;
        b=J9wdtHecMlO+ItiN6TBQDpGnM7npOEeIx5RhgKzK4PLjEuDdRDUAKORH7hhE27VJIa
         yOVM5LpwT3ggqLTSBLCqMb3ytrcQZfLPjtBfMFo/k1aknOzCQsZyZXwyG/V894NT+3Kv
         RI3RyUMoxht8Wy2e1Btpd0nrnPexQV1LAL/JBKItGdf0lfzeDiq9rdAmaultv2akoim+
         VRJGXw+U4kLwDt0tu69Om3WeDCSQiJmoX2cubf8GsbqtW5hf/ejKEtg43HxFoj9vzfw2
         l93sJA8a36jYHGhmHjVYD9BjWbNJGL0qauLvCckcLkYja4mbbwFDUenQ9Zo4yfxgl9K3
         jj+w==
X-Forwarded-Encrypted: i=1; AJvYcCUOK007D3djmJo9Cv+F6K3sYszmhuXTEuU39n+RAPa1TRovd4fTi5T27DHDeJmsHc+gOeCL/slxZ2F+zGV27cfa@vger.kernel.org
X-Gm-Message-State: AOJu0YzI07sUPpi21rXLzFT5o3CaqRxxoF3nEWD2t+0ayqgBvA+yCCP3
	9jAgVzgguza5j0SMNsym9A22hUwdFG18iY4PYqsO3N13dqULivJfI0fGIIl4E7MVkVKEwvPg0RQ
	qo+HeTNW0CU44ULXHfUfUjQip4OYMYK+LE3P1RTqW
X-Gm-Gg: ASbGncsbQqeAv7OufmPvUdfNFNqUbw6tWrNkgVXoOki4mEuSuAyAwr+GzD0s7XVyGSv
	dovCttI+XUAo7zjTI+k4mS+Qy7vfgXg2uXZdrNk+N3qNR26QlnzpP/EYLkSgh7gP1OF/0CPojgQ
	4v/JP6fk+YrbxnJ7P4MB84YTGM7K3YxrwUe/yLZHJDsADajP3t8K8SYZiveu8si78W8j5DFKIkj
	lret3uzj9659/cRw20rnQi016OCbI97Pb+YnwBQ/T8hdQ==
X-Google-Smtp-Source: AGHT+IGEMdfa/7pI/vtQhZpE9t+GCiAKzWTtoHMGXUrvfqlTr4xGM3G4p6O55TyjazqugJ0Dpoksr/xy8ncvPcXnu9I=
X-Received: by 2002:a05:6512:3a84:b0:55b:57e8:16a5 with SMTP id
 2adb3069b0e04-55b57e81981mr94240e87.32.1753348622453; Thu, 24 Jul 2025
 02:17:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Jul 2025 17:16:51 +0800
X-Gm-Features: Ac12FXxEOfXERpbm54RTrpt_sFAe6oyRhPRCsENRyO12HQ_K_abqIUXAGxmi264
Message-ID: <CAGXv+5Exb0X-6V=bdJefaz+m=eXSrrw6_SgWY6vDF3rF1RmVBg@mail.gmail.com>
Subject: Re: [PATCH 02/38] dt-bindings: display: mediatek, dp: Allow
 DisplayPort AUX bus
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
> Like others, the MediaTek DisplayPort controller provides an
> auxiliary bus: import the common dp-aux-bus.yaml in this binding
> to allow specifying an aux-bus subnode.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
