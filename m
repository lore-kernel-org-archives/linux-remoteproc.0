Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B5380026;
	Fri, 19 Jul 2024 08:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721379125; cv=none; b=id9XGo6ZxQF/5+I1z8MPvAEoCE7dL+fm///rKeir7cpGoX7FoPWr4PDQ5Q9NDFQD7zMXd6+nDppgqq4WXnDoPAW7ao0OtioufbsRDq3rJzAjS5NhH7vox6O1H5gJBuPC93w4MB5g6quSRkJ4JTKGGUTvRZNV0J/I0FcqROjwa2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721379125; c=relaxed/simple;
	bh=r8oFgF9hsmNmGc0Nc9AK6CXg8ie6rgCUDmSyIstaJLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KR+F+q7aydMcB5R5epoDqeskbLSYunG2sxtwHJEMa/vwagPDnACCpgrHc2G3ED8feqlbORUYIz3kvmyya7CLEdAazjMiv1Qxw9z3WdYrnZ++bGaaESCqkYrfIgxgjYW/3qBng9GBWn8YzrX6PRNpoxr3pz/ziH59dE8El0cSY40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOTI06hX; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOTI06hX"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4266eda81c5so11388005e9.0;
        Fri, 19 Jul 2024 01:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721379121; x=1721983921; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8oFgF9hsmNmGc0Nc9AK6CXg8ie6rgCUDmSyIstaJLA=;
        b=BOTI06hXktK1P3/+hIDVk5O6W7s2kxCaAcstIxDfPGHTDYU4efF0zUg0Npf3UVNTIB
         1tCQRrm2ZMDy0Yin+zq+uOm18LdvMTbwj1TEO8CsfBUEUqnK7mLkhdRvUSzhAMGGNdcb
         MRzflp7pSkY30TcYtohB+XR8ONHPZCLRUvoUnA8EhNyGlHPjmXYUtjx2cpXyExbBXnNl
         y77WrFO/dqb0RNzjMxVgwvDVKgfeKe+QYknUB/X6aKl4OYx5Xn+vwSSt0loZR+ilv9FF
         zmfSAG5UKAK0/jSikQJefrizb9SbMhbLplobd9IGmu90Enz+LSoJJnufAfCbjdjmyQQT
         2tgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721379121; x=1721983921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8oFgF9hsmNmGc0Nc9AK6CXg8ie6rgCUDmSyIstaJLA=;
        b=jYKBySHZWQq2nwTcjrC8dGEQyv7QvfxgULrnweEh6d6Ic39AslCUB7UWQZ92nM92ER
         JiIcgVAisLO6o7tPWt/GgszeHdzopH0HPUahOeOclxWFTDTKP3xEUaNHiTXYFybfeARo
         afPknQQjyQgA1NtKVgiBbiUDpG7V+/MbrUUWO3oyIxJ7mPYvW2V/MSNn8Zcr5tpoAbu1
         bwxCkODN8KnHO26o+4eLGuyyUPzATF5zFIN2KQDMW8OqmCl81tZBpmkMT+nk68Shedlf
         Rn0XBnk4nKG5J9JwiSGmAVPZFHi6a9BF9lZq8f0sscNmcr1UglpjgRvqmjvljHB7LTV3
         r8XQ==
X-Forwarded-Encrypted: i=1; AJvYcCV953OrHLH72Q6AGCcX9UWSpf1y+fBfxlysukaz3eshrkjx5I30aYxtV4aAfqn8jcBRAk3GEbrxy7ri1oLvQ1JUqEvrT06YA7f/v4NvXpCmV4UCVRbJGwmbKRkNG1pcLZKZB/ChhrDHVI72Ki0d4Q==
X-Gm-Message-State: AOJu0YzPONBk5meYMrvewQJcSqWvD8yIN+BkOsVlUsfpChQDXFuqpsmJ
	cDtGjGZ3AcLAZXQL2NQttZDmjHtLFUaY+jG/hJHGl3BcCXQ6/qP0icqZdKppZTZ3iRlU/o2br1V
	oQlDoWZfz0841RVErRXiBE0nUuwg=
X-Google-Smtp-Source: AGHT+IEv3qCK6lAidNklfBcgIVXCYYSmSxxXgW/Dm21GqZIiZZ5HailN4WXo1vsVLga8IxfI0D2fv7nNamOEy/sdeQs=
X-Received: by 2002:a05:6000:2c8:b0:367:9c46:198 with SMTP id
 ffacd0b85a97d-368315f1ef5mr6492142f8f.1.1721379120874; Fri, 19 Jul 2024
 01:52:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240719-imx_rproc-v2-0-10d0268c7eb1@nxp.com>
In-Reply-To: <20240719-imx_rproc-v2-0-10d0268c7eb1@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 19 Jul 2024 11:52:44 +0300
Message-ID: <CAEnQRZAh1P0i+Uj1+vrvZM4vVuxuYR9tN9FMm+khSSvwyz7hhA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] remoteproc: imx_rproc: various patches for misc
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	Marek Vasut <marex@denx.de>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Terry Lv <terry.lv@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2024 at 11:27=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:
>
> This patchset is to upstream a few patches that in NXP downstream for
> quite sometime. For patches directly cherry-picked from NXP downstream,
> I keep the R-b tags.
>
> Patch 1 is a minor fix to DDR alias.
> Patch 2 was sent out before,
> https://patchwork.kernel.org/project/linux-remoteproc/patch/2022011103333=
3.403448-1-peng.fan@oss.nxp.com/#25144792
> this is just a resend
> Patch 3 is to avoid mu interrupt trigger earlier.
> Patch 4 is merge small area to support elf that has large section
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Neat and clean.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

Thanks Peng!
