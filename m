Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CF22877DF
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Sep 2025 11:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758542074; cv=none; b=TkrnFjiPX2to9H5E2ciZNc5cVmCz60x65/YOeTJPzXRFC4yb9JyvXXFLeSOZUNNAJwbbQZ5VBxU6C/hcM/Gdtgs7N8jo2dEVVxvZ/LBhFBhB5rPtrEZQhuKVVV10QXA1B2NT1Uqu16vrB/oi//1XHQPB09Dvah5JGnHkSy2Uv8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758542074; c=relaxed/simple;
	bh=H82PriZ9rjpzbtA4cB7LLdyiPEBtTfyUNElybLELZfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r73h3svwVesetWw8uJ9XQytTvEjD/7CtHLmXyeGODjCFiWam3JJ5lgHiobwAgJNMONwhd/dCgazYQEWGbqFB+FUd7IX73PI9e+FObUOvFW7YP+ulWL2rGwej1eU6icRT6KLKzGgQlzsXutNdf61v474PW4B92JThLEKHJJoLRrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iemcd2Tm; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iemcd2Tm"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3304a57d842so3025138a91.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Sep 2025 04:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758542073; x=1759146873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H82PriZ9rjpzbtA4cB7LLdyiPEBtTfyUNElybLELZfU=;
        b=iemcd2Tma11KFA/ZZkXJVF5wTFRWIyUV6Ywk7qDtrdxLZZ0SSOeJJoa2ZovVj/+X77
         pTY5Q/S3TlMKmjenbqbdAzjx1ygEL2TSK0j14zeIzqtEcdRJpQKq9Cms69YfstSZlRRv
         fIxu/dm+NjouiPGmtg5+Gp5sqACT1PFEKsFYjJ2x6OJZ0opyuC1JLD14TflxiSkHNTcV
         PcSjZCp6eETNv7jBU0qjcu2BjcVwODRWN3+bn76tdq2drAdfZrKFmjC1fApBpGt3E/pE
         kOgwkdWSlJg8ApxGxbFSW+nRMX1Nigo8MmYHDNF5hrzoX3xYjQgxWMW7+X/TGUeldiSc
         FgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758542073; x=1759146873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H82PriZ9rjpzbtA4cB7LLdyiPEBtTfyUNElybLELZfU=;
        b=qKeRw4D4hrTvsdRLpmkflnH8AcB7i3sNQqQDdMiN2hESaadGoJgIZQf59INfZukODQ
         hXqiYrxVOOeH0JeKSG3g6qnDF+eV9X937DP2MzfhzOZF4/u+hJKO8v4mZ+sxNHc0kzTz
         ymkM8jKwTm3sSis/+aH5gf7Tbm1vellYAhC5n/kUY14RpoPPM01hxqozJsXMFEq1wJd6
         HlpNqLE+g+/gjVDOoYJRF3PObIUIH0Jjf5GzZUj4BCm7LVZphUBXmbFKnucZPvaGP6WY
         k/dVWysp4KbmIWuPlYwiOI1IJf5lC/5LxoE0bx0k/PKsLtnVJPtI3v5vaiQ/EA38244S
         uIkw==
X-Forwarded-Encrypted: i=1; AJvYcCXPVdOuzvoYOm/AmOhe+86RePhVAmn/6bixs6W92s5nsQiszy2+pOT3SMbTSKuWq1+gCD/MGWescagwjy9q88vu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9IbMnK1l19PQr2oJpJjPBfhUl9eGUrENCglTql4eH3RAnAR/D
	qbdZB0WLK5yC9PQwLog6f0D1HP5UVZC5z/HuS2w29tKdNSQWoULZMkXHVS0VL5aY6H40kpo84p/
	dE+oyCC8w/dzS+0UvpO4veBhKZkyWQu8=
X-Gm-Gg: ASbGncuYhglZwFDbgqDb/gKOw+ZWnU6b50CKCGDjEJHDRuAZCg/eHhdnaQMt0/QSScG
	KpCQ/dzoAgLoP0hx2vUJ7bnqCpB/JrnoO8u5M+Abj69UVPE69f/IMD3uKx12WLE04ecXRR0NxTZ
	vzsBL0xmtTM20WTp11oyI8T7HRFoLRh/f+GCAEfrz+SMDUi0KaQWn7oJVK7jQOi4H+D/F2G9/yC
	bZfWXVKVgYjRAN+x8gqUmS+tGz19ozh2HnmPk2sE9p12rM=
X-Google-Smtp-Source: AGHT+IHzxM4yiWZAL6zxD7pQbX0TaeY/bJwW0LY0llQOlSdS3iORCuACnssvnMbvtQZrqfxj7+ITUfMjGupBB0hJduI=
X-Received: by 2002:a17:90b:3d44:b0:32e:a6b6:6d00 with SMTP id
 98e67ed59e1d1-3309836d4a0mr14833310a91.25.1758542072686; Mon, 22 Sep 2025
 04:54:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250920-imx_rproc_c2-v2-0-3351c4c96df5@nxp.com> <20250920-imx_rproc_c2-v2-5-3351c4c96df5@nxp.com>
In-Reply-To: <20250920-imx_rproc_c2-v2-5-3351c4c96df5@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 22 Sep 2025 14:56:48 +0300
X-Gm-Features: AS18NWCo7SM87IX5gqcum6VQNj3ji3-ObJeD7tPNQaPVNEbSqpL0MuoR10HuEnI
Message-ID: <CAEnQRZAtNCzoPdY0B=NXxKZte46XuVSNm-cSkEj9mUr7TF5BNw@mail.gmail.com>
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

On Sat, Sep 20, 2025 at 4:16=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> Add an entry for the i.MX remoteproc driver
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
