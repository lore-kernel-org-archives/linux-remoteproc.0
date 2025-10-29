Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DB72512FC
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Oct 2025 09:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761730346; cv=none; b=SHsP1nyjj1Q2wEfF2OOznCGl0w0UN2xVONuxaHvYiUWcIII4zI2aQ6UsZmZM3ZmfDkjRNGFOYXwssEDyqC41Ifxh2YemBuO7zfgRKHvcsDNgqlEn9Vd5vSmTiLEnzvrmd3+vdmlJusip3EDCuG+yYnnHAMAUzIAt60nU9ETkY78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761730346; c=relaxed/simple;
	bh=zHnOac0Axereq2RGbOFUBP+3/ezbkmVz1rWBPmLr1Eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sqz80YPD5rqxwGbezGSVK+xHWrkVDs/vDme1SjJUy0e3/hRh3Dg+ADEy+eZb6JSpyGHvVbtvvDRPfC0v77dv6Kq4VPCYurEd/bEFdipDbAoB7PKVGewi22X+KxXOI7yFX9F1cyeHOHK1oqVPPN3oDvT1jKRsAzEQPH+LgEZ3o4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GnPAK/3D; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnPAK/3D"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-27ee41e074dso73630855ad.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Oct 2025 02:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761730344; x=1762335144; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P7gY71n24jkS+kac1oyH4zGLv4Mgm4d4NB7g+mYr34w=;
        b=GnPAK/3DjbHcvBihP/sx02XgKpamERECfuFgRgtqVWB8S627j7ZbSsrP3dpStjrIUT
         1ART3VDwgbAm2ivaMlztyz3vPObBSFiEWNdjja2kYYaQE/u2p97vZH+VrmK5btRrF32s
         7IjQFMyZjNHQH7qT3FAG0kxdCyeCwSf0O1vHVDlfNfo9YTTRL3hW2wTfnjSpxSZjzGVJ
         y+2GPBy21INPT4Ty3azCqfV0Kv94Mo6JwyyaMkb1y+EufZlbC+a2Fx4hlmxFq9pUvFhy
         KOgP+7DABvDJU6KewDQTKxuvcnfuV7zzw8Ik4BcUO4va+AED1VmbUoiVAOWBaNmeDe/E
         sQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761730344; x=1762335144;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7gY71n24jkS+kac1oyH4zGLv4Mgm4d4NB7g+mYr34w=;
        b=INw5kvOqE+JaQJQ51VR4sW3GVXnjZefXCA0ZhgSltQWS2/6SGv4BYFaMFhdtEcEUoQ
         9jInuG3xFWUUkzaCh9LZ/RzodbrPigcMmLihaGUiIX1wdlJ7uLhkn2laJhY51yNHHoKN
         LnpeSJMd7ooZisEwHPtAfFYZxN35SfftVbsC6EFI+EFsYP1lOv6slNSaQV1gKEia719T
         oV+tQZUsJVQTsG6EiEVr+E7DnpNYgFYTk/WJvjWoxVlWgqsIi2eBRaJNPdFrLYj487x1
         9T0O9ZubtKdArYuj93sbtDrxenhPmNxV8dPULOTE0cD64Goycaw3Cv4MzWO6cHZtj5HC
         6mdg==
X-Forwarded-Encrypted: i=1; AJvYcCV1yluUhRBUcLgkjfaDahLWmy9VH8boHOrtwI3WEef38MWtKsda/l5ZQZt8ijI/1wZxHJIOgCVASmOlYUz/pDPG@vger.kernel.org
X-Gm-Message-State: AOJu0YxtW20AoI1073SPc0E7om+1eUSqTxBSrmEI/h2mF57CFtQfiagZ
	B858bzrje7gJErKaaJKf9RcscUP08ROKAJSHeHyW6Ngq9dJEHHrG+LhGrlnoUE9Y8xbxHydjvyl
	Qgvg0IVUU2PhCXN7Yj+Sg8WbA533SsBQ=
X-Gm-Gg: ASbGncvmrfCxtpmjDtI4Kv6WY348Av8ntLO8wWYAUMtNxaP/xflrcOVJLlBxRRgnJUJ
	oinDpy+ntfJkF+Qqsbgoo8o8ZxqxZhbRMZ7cjPnuhyTOkqncyE0zsezHIKSi3l/s5me9ypG+U+5
	CR59MaxdRax298O+Sp+mFmtSQx//16aBT2NsgbcJfkvZ1Vc2RiGc0OPFQ9rqVrFAczLnJsQrcAu
	ZpkBWuiiO1MICHmn8Bn0PGCwhMzPnxRAnjFLctMkAkal/qCjx+iyEtFjeMg7KfmkgJhZRtWmXL6
	DIAG959bwODDkA==
X-Google-Smtp-Source: AGHT+IHEmOYvQKBTiwYrDdUImmONCxMn+7i+FjSXTPYthBD2JV4BFZY8+M8zns5YrqEDI2UCuQBIua+fHP0X5y03rTw=
X-Received: by 2002:a17:902:c408:b0:273:59ef:4c30 with SMTP id
 d9443c01a7336-294dedf1056mr30630685ad.15.1761730344236; Wed, 29 Oct 2025
 02:32:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028-imx95-rproc-2025-10-28-v1-0-ce9e7db9edcb@nxp.com> <20251028-imx95-rproc-2025-10-28-v1-2-ce9e7db9edcb@nxp.com>
In-Reply-To: <20251028-imx95-rproc-2025-10-28-v1-2-ce9e7db9edcb@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 29 Oct 2025 11:34:49 +0200
X-Gm-Features: AWmQ_blaf6t3K-8uusFpzUZDxAED2sVeQ3XqyTQaNCspO1b_QKvTo6faDe6UlPo
Message-ID: <CAEnQRZD=ynKyJXGneQMwX6NbHaOPNr4jxnP_90Ed860kpKUN3Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] remoteproc: imx_rproc: Add runtime ops copy to
 support dynamic behavior
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Peng,

One comment.


> @@ -116,6 +116,7 @@ struct imx_rproc {
>         u32                             entry;          /* cpu start address */
>         u32                             core_index;
>         struct dev_pm_domain_list       *pd_list;
> +       struct imx_rproc_plat_ops       ops;
>  };

Here do you plan to change a member of the ops table at runtime?
Like e.g replace just the start ops? Or the entire table.

Because it would be better to add something like this:

--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -116,7 +116,7 @@ struct imx_rproc {
        u32                             entry;          /* cpu start address */
        u32                             core_index;
        struct dev_pm_domain_list       *pd_list;
-       struct imx_rproc_plat_ops       ops;
+       const struct imx_rproc_plat_ops       *ops;
 };
