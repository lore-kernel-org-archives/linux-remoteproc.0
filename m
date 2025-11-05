Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D049261586
	for <linux-remoteproc@vger.kernel.org>; Wed,  5 Nov 2025 09:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762334498; cv=none; b=t8EofORA5VStlj7VQXjg7Oz1ZhgR+469pDfTB/e5bPhUZvDIleW5+g/hekCCW59RqeY/E+dOglClKRXDk+cgt59J8Hum2+FAAh8S6681pwwCHb0k2Gvy3MzCoVpQInoljllfigOOFPDZcS6LatqsdncylvESFN8coch2sHsWGcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762334498; c=relaxed/simple;
	bh=r6IAr6ThWrXT0VQC+S0LBlsjUYHMVkUu3AebSU18ydI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ffZnIjt08uHegXuxWTW3rRTUHWWly5HhbO0eP8MWqXmvv3NNW5yYXoeipMt3aBGmXkzLRqUvIzHzy5RhBACQkHLa8YeNnHCOVkYLEt6Bz5Z0juOKr6gMtnmsAJGuY3WT1vIZ1s7Ga8vp9fKU07etjEJ1YXgQY+G+yMNE6Ksgqtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFloza97; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFloza97"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-781206cce18so660172b3a.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 05 Nov 2025 01:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762334497; x=1762939297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6IAr6ThWrXT0VQC+S0LBlsjUYHMVkUu3AebSU18ydI=;
        b=hFloza97B5w7DsfQRSi4Mjmbe20uloSJ7wYu1EimKgZ6DZ3Na5V6ADVnzVomaUu6u6
         mD1l3vSGK80x7M8o1hqNS7Kz5vx1s4PwdNPc2T3YQwEii5ZmhXRXNXhsur+Ud+lIKhV5
         xwkFUK1aJPCYAGf+2+ty92lkFxC3UMTu4TKnlDTroYeZk9PB6s35t4XWsJJCe1A563RD
         GLfOuHwGXxRxbkh25qjzZdueFH0lvzkdhdcIEtOoHBwsKyLVVFvtFK47Q7sDGuEb//4i
         dNGfA5t5cq+V1oHpm3m49A8ja5DRWu/jz3nne+JTCF/cRM9zb9u61eeghGllBBq9ng7k
         CZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762334497; x=1762939297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6IAr6ThWrXT0VQC+S0LBlsjUYHMVkUu3AebSU18ydI=;
        b=w3R7GDIiqy/FTh+bew2gGzTlQAsk5Q+MQpFPy29wouXQFxBE/2DPprMWCVoyTZuiFm
         zzndWxbunnmXYuOEhABnZjFtmN+RJ9H0z81qlcfqCh95Uo/uxuXmVzBxFsaXRDAVkoka
         LMOsL16Q9RBQSaB9dX7sAUjGHWq1GimtS3MBwWOXc+Pg1yCtZki76+kHjfr7eB2XE6JZ
         ieJ5QKyZXcZV2q/R62Vz/Q5ao6u8DAulZxW91Yi9dwxLbw5tXUqDiTx9F7NQr68nPSfl
         p48BDYTWjA72ADfcnztCT3VnEh+tIwQ12kAghz4y84MOPIW8Jt4JI702f2OljJ0ixKAU
         9C7A==
X-Forwarded-Encrypted: i=1; AJvYcCUwU6NoNo3YTbAMoMx5vzyLxHzk/zqLnTe73kvjyisGtYUM+9xBLTsxQAXgcw8KV5kR5OsqzqJnmp+WMcIIcdE8@vger.kernel.org
X-Gm-Message-State: AOJu0YxTcK8IBAOW5ENfVJbsAgC8zKEaA6rY9p2bRa/SprX5J/GY+fSm
	LdRf1RugQmBKeIsyoSVOTrlQKwvQ8ly51kAnFaPMKBhyiho1lawMyJ7bMlZ9Ao6erhHZhRKD1vq
	gR0MQ2F9p5crHDZ0BvFGXxvYXxfA5cZE=
X-Gm-Gg: ASbGncvD2jscz0rQjryyqxyjGsYoIGGdqtoPRwcMfjEIcNWMgrOegMzmeUHdZjEjt3u
	6lw8Ipn3TCbjqsvO3Spy8pfqyXWbGg9z1zJXQ0V8uZ8S2WLU48yNnmQUJSVlkiNAJTeA1ZVwps5
	t7BfKfIeGayH2JzIDh5qc4EH/iXfAJ6/2zHqMGN9tHqsQBqA/29XT17Nlo67//UpYMUyTuK1jDQ
	wt/qZBBgnxxErVUfmFAWHZBwCCswC1v962/mMiz3533RyQpXV8unlRd5Q==
X-Google-Smtp-Source: AGHT+IEhLgnnarruJw6eIIB+8bTnN8uYAF3Chn6W7iyK13efG69zCQaoyAaLYmuTmnpZholD6kqVshKjrwpDBWN3vSI=
X-Received: by 2002:a05:6a20:d049:b0:345:4b5a:16b7 with SMTP id
 adf61e73a8af0-34e278f999bmr7748938637.11.1762334496625; Wed, 05 Nov 2025
 01:21:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
 <20251031-imx-dsp-2025-10-31-v1-3-282f66f55804@nxp.com> <aQUEzx6sobI4Yes5@lizhi-Precision-Tower-5810>
In-Reply-To: <aQUEzx6sobI4Yes5@lizhi-Precision-Tower-5810>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 5 Nov 2025 11:24:04 +0200
X-Gm-Features: AWmQ_blaxwVbzKBmJKN_0Fj3HFefT03QXEkDQ4Lh8h-h3RbucXTuRrqR5o2qb58
Message-ID: <CAEnQRZBNzo6RKjNf4JxxxjxtLCFfEGMMt2fSK4MdVeSjtF5aag@mail.gmail.com>
Subject: Re: [PATCH 03/11] remoteproc: imx_dsp_rproc: Use devm_pm_runtime_enable()
 helper
To: Frank Li <Frank.li@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 8:50=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Oct 31, 2025 at 05:08:32PM +0800, Peng Fan wrote:
> > Replace manual pm_runtime_enable() with devm_pm_runtime_enable() to
> > leverage device-managed cleanup and simplify resource handling.
> >
> > pm_runtime_disable_action() not only calls pm_runtime_disable(), but
> > also calls pm_runtime_dont_use_autosuspend(). The current driver
> > only calls pm_runtime_disable(). But this should be fine here to use
> > devm_pm_runtime_enable().
>
> looks like this paragaph is reduntant.

This is not redundant! But it can be phrased better.

```
Current code on the cleanup path just disables runtime PM for a device.

Using resource managed version devm_pm_runtime_enable registers a
cleanup callback that
sets autosuspend to false and then disables runtime PM for a device.
So, basically the same
functionality as we don't use autosuspend anyway.
```

thanks,
Daniel.
