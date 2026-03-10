Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419CA43DA54
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 09:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773135193; cv=none; b=LYu8QYxtsbuc+IS1kHny9cRCb7DR6SIOcrV6fQfbCyYXGYh1oIk/fxIsMMhlBKMaihU9V+/Rw+Uxzqj/d9NXycZtiyaRL+8vQGv60qeOY1qGt9h7f3BzLpw9u4YtfT548284Lq/HYgo4aA5+tzZH99AeimUJQfjrc7scrntv2Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773135193; c=relaxed/simple;
	bh=iJrlNVsjh6+70Ec05z6rXG0svXgiagQ0oIi5LjzykKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DunNhkBcxprETLUNah6QW8kwP3ba/PGiyJ/sLgqBnC+yDhWAOIuXHbTlbRvpklTIxZzti9vnECe7RXEJqz/pIINvPVT8j+W7R22NlHVPxOLYPnJ4/Cvnhf2KXYwilbSgzALRlgKlcefSaSoH7SobivyAMYpD/Ro5uAT0Fwxibbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mY3Ca3/H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mY3Ca3/H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 040E2C2BCC9
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 09:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773135193;
	bh=iJrlNVsjh6+70Ec05z6rXG0svXgiagQ0oIi5LjzykKg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=mY3Ca3/HEqRL1B0J9UDvEJsmn7P7e25xmxrk6/AjzBbbZnYWbAL1l2mRGg0Hu2E/C
	 o1ZOdicwGfe/YyLu0nB1GZApWdL+Kc0aKRHeOjyjRC9y1GdP7kNe5TMdLNvp5hnGj0
	 DXu5vC4qWM6T6nUb1k+q6VPiD8Kn4g/7Mcm5Lv6U3anSCEwICiGf3Qst6C3wsl2pkm
	 BFGiiOOaaVND/P/IoZ8KVVez8URAYrTO5u0YI8eWR2aHRFvpFJUYfoVyFFsYgHUiGk
	 FljTkyWz5rhYUpZCJUZK9EDqP+TC6oCqVNMj/VZkQ9gvQhW74dLRDg4evWaPDd9gtj
	 Uy+bWPerEqlLw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38a2a59baa6so54208361fa.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 02:33:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXBVNmCg0H20lPIia0eoqWFRg5SPlDh/qOnSX98zfoQlS/+NUQpEThUkRxMoeVwkStngaJyjRKFBZB2xAIIZqbp@vger.kernel.org
X-Gm-Message-State: AOJu0YwPJ3P45zeosAYupjmKkaxuDZTI3S6cFMRg382rF2xB7aAYV63b
	3DZvIPOGUUte+ImTx552PZjAcg3F0/J7vxKeTwlLjGUdVpm4GHDRi28YGvxGHgz7hcQ+loQEy3W
	CRRBT4Si9b1jJ/pidJakeoM12l6exfIE=
X-Received: by 2002:a2e:bd82:0:b0:387:20:bdbc with SMTP id 38308e7fff4ca-38a40d61d78mr46199441fa.12.1773135191017;
 Tue, 10 Mar 2026 02:33:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com> <20260310075539.11701-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260310075539.11701-4-wsa+renesas@sang-engineering.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Mar 2026 17:32:56 +0800
X-Gmail-Original-Message-ID: <CAGb2v65gV+2xZDO7h9Dsx=iOHX6Jt_JyHTOeWRYaEMuC+jR1FA@mail.gmail.com>
X-Gm-Features: AaiRm51CffgMBtgWhMZCUpMdeeAdI463XBf8sQip2RO0V2c7exzECk92c7gy0OY
Message-ID: <CAGb2v65gV+2xZDO7h9Dsx=iOHX6Jt_JyHTOeWRYaEMuC+jR1FA@mail.gmail.com>
Subject: Re: [PATCH v4 03/15] hwspinlock: add helpers to retrieve core data
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Wilken Gottwalt <wilken.gottwalt@posteo.net>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-remoteproc@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 3:56=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> This is a first step to hide internal core structs from hwspinlock
> providers. It adds helper functions to retrieve the data needed by them.
> Because all users are only within the hwspinlock subsystem and the
> change there is trivial, conversion is included in this patch as well.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/hwspinlock/hwspinlock_core.c  | 12 ++++++++++++
>  drivers/hwspinlock/omap_hwspinlock.c  |  4 ++--
>  drivers/hwspinlock/qcom_hwspinlock.c  | 11 ++++++-----
>  drivers/hwspinlock/sprd_hwspinlock.c  |  6 +++---
>  drivers/hwspinlock/stm32_hwspinlock.c |  4 ++--

>  drivers/hwspinlock/sun6i_hwspinlock.c |  4 ++--

Acked-by: Chen-Yu Tsai <wens@kernel.org> # sun6i
