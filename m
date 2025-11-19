Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9393557FE
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 13:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763560205; cv=none; b=E4vewCRTskiy5a0JCkRLG3gOJfAtXMJi/AGJiJx8Yke8gI1vHToC7Gmp0oACwnKCgpcm7iUaN0iEpNmNWCTR2soDgDAvEqNc8QsKD5zJk6NairKu/RE8yLFIHeHD4DCLZH5hkgvsp2Y+eou9ZcYkpm5b790RlkAzSljQwaIEDts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763560205; c=relaxed/simple;
	bh=PA3aR//XqqSLd6aBP1s9HW3fQNaQLmdD9BHhitJisII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdNTnBTPgZYFxkF0LHEJgTiRzW6sjsB7+rjpJglEgnN32V0AbfznZaiMRn6ggvTwdYTSjfHUeWf5JJOEcW7ElBk18Iyb58du7kmUekkmz6IzIH6h+sdL9AyjUZC3nQbKTZmGjFC1iDuQRTXu48rSavHBqOgPVlhi2XvcNP3JwXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CthwyjU1; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CthwyjU1"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so7632836b3a.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 05:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763560202; x=1764165002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PA3aR//XqqSLd6aBP1s9HW3fQNaQLmdD9BHhitJisII=;
        b=CthwyjU1qGyXliBFpwkE4C5h1etNzc5bStNKEpI4U9IBYy6zsbVCUwqTd14XdCSLkJ
         wt1kwfkbBTlrb/QhO8mn+J3neBhngKY7VD1JVebCxENwnXduBtTeB4uX2S42n7gnm+Hr
         ZtxXz/NfnwQk7ONx4clc1qOJ94yMucK6VDacesINBtmrjdTgqZoQcYdSJPDyZE8L/L3O
         Pfmvn9TvVZIiKCHraWbYc1pOro3VlP27Xih63QzhIM6CugI43lfH5eR7i7BRgXktdDcF
         n3KwjxsXOVXk3nf9+lxOFF9LQ+FChQgGN62M8C4ihNW8EacOLU7bfViuSgNyZgqlIvLR
         Mfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763560202; x=1764165002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PA3aR//XqqSLd6aBP1s9HW3fQNaQLmdD9BHhitJisII=;
        b=mI2iwr3Cz4shGpGAyhwIP3vP3s0pslY7f5ivqaNGNwlPYByQVz8nV2H7gAbxT3P6H4
         eQ24NtL7ivYwFjA8VJPgMxSBORMSQONrKxXtCqTbr8LVo21XXVb1ZmKM54IgKJAO34yJ
         gFWbLBj31c8UFeOrrY9caaNYLJOMpUtdNHXdiF0yVyoKwBqg1014HiGDrzrYrs8+lt0T
         QfhNhOXegQeepcku9WDMLvCvyOyMsWp1pdwOzvTXJ7bzTj6B4/a8biWUsYFer5zZVO0P
         ym//RRGCXA+cQgrsYpBMScY7EgLSpIKj3LdJCwWds0zTb+e7wDe3kY3BnVgJWiasiLGc
         vRAA==
X-Forwarded-Encrypted: i=1; AJvYcCUduMj3rxctbSVYknUB/lFIeY5vIns+Oaf8rMFKva9CK/ebhNYy/0HuYxifKqoCBYDHKMvdFqa3n054gNc8FRY7@vger.kernel.org
X-Gm-Message-State: AOJu0YzrLLb4rKOnhlaziRB4jFzeW6yXYHUFJEtUsi5Tw3UAlwmuD2D2
	/gQ8rpoxA56OfLkLW7EpEcMHM45d+nTIAv4bz8VjWs8X+FMhWs9qdSETS5WExnNDYH43c5BJeBS
	yzfF/16Gv79sSFeHLrkWsbXDl8oTElFo=
X-Gm-Gg: ASbGncvnIw2FDUQrsRRm/i+YHkyO7o1T/zcmpdxNLeBhjxc94Rb122HTavi2FcgX3xE
	gAGlM3wUyallMd2W6b5GXnzZpYf62QQnZ0ylsp0ZBneXuAQoj7otbihJEa0T1K8/c1xdXRzonat
	NvSmLgoZqzDmYzPsKdnTRbSajEo9Wpn8XcnhqIjrRIfSbo+uSE8ky7bzwWs43b1SG6acS8rOsQu
	7aphqQEUNFPLCbaAsLlEOG2tUYzVpqAysX9Z7z+XFgmU4AiCmO/KZd7yw+cYKfGn7moeozAW8v9
	Zt+iDL4B+uAiEE0rxzXdkfISUlTwC0UiutBcrRj2y3OPB9nMvlx0khZPDIgALIeCLUpww9y/Hxu
	pCV22L6tlXu1lM+akWt/p
X-Google-Smtp-Source: AGHT+IGGVmLiseawcnvZbvhRX7fOL6QAlnymjGCnNl5Y6MJZz/aS1YjF5zsYCLKnAh6kSr2Lo387+JLD61i9on7r+MI=
X-Received: by 2002:a05:7022:6091:b0:119:e569:f611 with SMTP id
 a92af1059eb24-11b40faf26emr9338366c88.10.1763560202365; Wed, 19 Nov 2025
 05:50:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com> <20251119-imx-dsp-2025-11-19-v4-12-adafd342d07b@nxp.com>
In-Reply-To: <20251119-imx-dsp-2025-11-19-v4-12-adafd342d07b@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 19 Nov 2025 15:52:30 +0200
X-Gm-Features: AWmQ_bkuVDMyYfENLfIkZrmHLS5NB7j6e-0_rwXCFGVWssgFpyz5qyPLJLqiH7U
Message-ID: <CAEnQRZBMiZhEx0ziNbxpLLC1OK4CqNQQkYUncHcdGXe=mnJC0A@mail.gmail.com>
Subject: Re: [PATCH v4 12/12] remoteproc: imx_dsp_rproc: simplify start/stop
 error handling
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 6:27=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Replace goto-based error handling with early return pattern in
> imx_dsp_rproc_{start,stop}() functions, and simplify if-else logic.
>
> No functional changes, only code structure improvements for better
> maintainability.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
