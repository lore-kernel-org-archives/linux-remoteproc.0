Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E619226CF7
	for <linux-remoteproc@vger.kernel.org>; Thu, 18 Sep 2025 12:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758198914; cv=none; b=c5+N3icK0o7OLC9w//3tF6KkhanwBYIi2/Yniyu7/22B+6ec6ObteOPwRmc3hgmRZDuA32UAGfd1xh14VIdGeFiPth+UfKYMCb4uwP4o4CONd6qCCYXR2dX6HKxV76ioR1PW8R6tQunMYBCX/k5X44VGIfuTtujp+znXgMASRws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758198914; c=relaxed/simple;
	bh=WmwG2u+A6lb0Y98jTWbQ8dh86e4JAc3PFQPA4/aVVM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HGvnTnh87Um0s20Xn4IwE4LvsBA6obvcDjxWxfDwnCcSo0NqT6371pQvo4APkisSuzZWi8chosPlar2liyy07FBa3xpWvvC6XI11qfLTrOah+o58Z34fsxXuHkS9JS85zA9VMuGI1ozCG8xMsSO2YK9vp/ohzeqNzGgwlLh8FUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzWDkdph; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzWDkdph"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b551350adfaso140928a12.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 18 Sep 2025 05:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758198913; x=1758803713; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmwG2u+A6lb0Y98jTWbQ8dh86e4JAc3PFQPA4/aVVM4=;
        b=hzWDkdphmuKi7LxqGR08LsiHUgoOI//Ptp6VKBbmLRhr354iYdCD5TOfwo3hYLxGeR
         ePhQHST9O4IR8+7bklAPnnkeBAhDP5q/BvJXGhYkFPbV2kucCSuSBQ71PENNxNZ07+hm
         HlGEp57yN3zOdKe82xkPXqTbeslx0774NagsHa29sr9+4qYTep0i4mE7rUCPpyFX4/I8
         PrxlfXNYrWEhMf92iSe+5E02+EDsDkD5EwhYQi9W8N2Xyo6kc3shrBEU3a7ZTFhP1qTf
         /inup2uapqBPfHOAYEbH8z9QuFrCRCIn2mdfVJ+y5Dd3He6iTE7sGZrXieEcPaoGhBSQ
         SzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758198913; x=1758803713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmwG2u+A6lb0Y98jTWbQ8dh86e4JAc3PFQPA4/aVVM4=;
        b=OF6wLJ/YKqXgPobJHMvzCDTPqmyZTY8uDyjrDYkpNyPCIOBgd9mu2jdscZZlp4fqJ0
         bW23sdge1XJSlbPIcbOzQfnpYtd8xiVMsynH5FcoLSLK0K+/gAToRCVls9YH1UF8lFgs
         siZO3AZpE6s9wJWE0Sv2fwVzp2GvGKU3qTF4BInNI80A6X/kJKsVazT1iNewjFseZci4
         3Zj1uhwqUOzqF9e0PXCVmPhz9v13bSHcMJsSlp3lzFZWBIE9zvFE5N1Cm0koY1kmI4Kh
         tH1TzWkz+Y4XW6DiqMKLULXlKNPPy7uWXxg3MA4ZdpjK4vveatxjuFS7csJZTyqK7O1A
         r6pg==
X-Forwarded-Encrypted: i=1; AJvYcCX1Py5nmBFiLo+BWB/Wa5JIFji0MnUeQ3J3Dvhr+8Yz77tsjSQJFMHakrCKhHjgLjojmLaMaT4c9nHbdt3f1caC@vger.kernel.org
X-Gm-Message-State: AOJu0YxeAHca6DN/HRAqv4b1LMDjqqV1b3i8EI77JZIBEzX/ajgZzvZQ
	XkB0jv+/F0e4aH/+Vu95O+RwlmGBRgfyMqfR4YR2AivkkubT3tpT1hUMxTGJU3t0IYvH/X/Z9dZ
	ZIZHRkSZCRnrFsDby/ah02RIB+h+K4YA=
X-Gm-Gg: ASbGncsmL0eomdJUnpnOaOpzg2CAsY1p0zrkg7OH6s2VHVIc5sMQaroJVgbtTmvnjjY
	YypWsVyzyFJcZiePAwS4qn9c98RDsMKr5vd4ckDqPvQyxPsJXBE3rQgC7KRJ40HwRCVFN+UCEos
	VKxiKQJkPpvt5u/vdCWMFRSyaCVmLST/XDvoYauYO8j3NbJewo3g3EZ0nzEfXYqDDp2tmT0ogq2
	uNymykWBRJKIpOqv0hS5I5eYJ06KTlyAe1IvF6/5dWg3iVpBPH92bU=
X-Google-Smtp-Source: AGHT+IF5CLHJIp92USkA4+4XS9SnflXRFNFA4KNQ8mQvZFJgKz7NDJudA8HZO2hgaQ+oWxgXz4tBfw4gYVeBO4KbAgs=
X-Received: by 2002:a17:902:ce91:b0:24b:182b:7144 with SMTP id
 d9443c01a7336-268118b4708mr79285865ad.7.1758198912690; Thu, 18 Sep 2025
 05:35:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com> <20250918-imx_rproc_c2-v1-3-deec8183185f@nxp.com>
In-Reply-To: <20250918-imx_rproc_c2-v1-3-deec8183185f@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 18 Sep 2025 15:37:31 +0300
X-Gm-Features: AS18NWAc8U_p2z0I7kb8DWdQ86uq1YFFMY1dQTrBWLLBGeNxnk_fylcKHlj3yqM
Message-ID: <CAEnQRZDZ+unzySHbvMZaAfjecxWYCicCKbiW+Oth8JL-tZpeCQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] remoteproc: imx_rproc: Enable PM runtime support unconditionally
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 2:52=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> PM runtime support is safe and applicable across all i.MX platforms, not
> just those using the SCU API. Remove the conditional check and enable PM
> runtime unconditionally to simplify the code and ensure consistent power
> management behavior.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
