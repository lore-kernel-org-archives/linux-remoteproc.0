Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87BA3A4523
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 13:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773925798; cv=none; b=NkYsvSqWZkJuxaFBJnOFEkNvDBHE0vKJ5Bq/Dd4sA8IlQVeMrlhPQfdtqqIfcZIVpIN5K7LDO0qZe6zEHtohZIHtHrEz+V10dTak2aR9+eDfvnVu0dSAq1sSCnfg//6UMoSdA1UE91F17MqZV/BFi/tN2/IPRoFl+ZaAvJxaQA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773925798; c=relaxed/simple;
	bh=Ts/ZBzEhwzBq6L1alBpL4MrUmv33n0V3E/Ul5uCiuTo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DnZukvBYo1J+rxRUHDXQnSnKRc3jGbdKA95FClLLnZPn5y/SS6RcVeJXD26yjLFM1Jf352KPiCpi2z8Ic6iBQZOa5wPQ/zR/biJf36ygbqZ83tdbDnKBKXANTGSJYSKtfqwXjl6NJhBO66x8TE9LFxvZHQ7gIjdnhJh1rxgv8JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RacmPq1b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RacmPq1b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA49FC2BCB6
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 13:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773925797;
	bh=Ts/ZBzEhwzBq6L1alBpL4MrUmv33n0V3E/Ul5uCiuTo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=RacmPq1bIqMeMcyhxiEK10j6ygmP3LMQK2Z2fVE3HCOxsgvgXy03lL3FuvuLQQvgj
	 GiQcbk0Gc68ea8eJ4LngePUDz9C5XojYstENdaRQM1y0oSw68pXH0FB/x9xYOoXLj5
	 yzHUkBwYEvcieaKcpfVCPm7nVCORUUsT0yOyNlGzfZbyxsZTMYNRLeKm/6/LsH6iAi
	 g+KwM2FKgeEjnQE4mZhq0fF6zUla5vAiMm1h5fjWA7LIX/ZFlm4NfZRaEHQvb0eRdn
	 ro9atKpn/5SRW63zxRDjmZnik2psm1mFQ05jHWL2srdHA6o0dMoRIWg/vWUDnwIL81
	 7blFfhRQzZ9RQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38ad12fb595so16225861fa.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 06:09:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzZDJahdSiIoX5yIYDMwvbMn5T7gw3fu3TKlubwMclk18B/RGncd2EIC5FgFjKt4MNk+RzdXlHW7ExXA9eMSvP@vger.kernel.org
X-Gm-Message-State: AOJu0YzbP3Qoj9cKAsJeMPkPb/5OGjwnyQfLXLcxzb0PxxxvcLoa02Bp
	PqYCuMJfoxgbx35qOa5hRDQqitXbUy8MaYm1Td4y7c4wYj+0NVtreRESJNQmLO3p2ua5UkErOCl
	MJlK3PJvM/k1MYx1ejyrxb7kfdm+3f9k=
X-Received: by 2002:a05:651c:324f:b0:38a:d354:cb2a with SMTP id
 38308e7fff4ca-38be5f51b90mr10131901fa.18.1773925796044; Thu, 19 Mar 2026
 06:09:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com> <20260319105947.6237-12-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260319105947.6237-12-wsa+renesas@sang-engineering.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 19 Mar 2026 21:09:43 +0800
X-Gmail-Original-Message-ID: <CAGb2v67j91R7vsY2WOjgWQxyD-2Y8mRXe1go-F2jsL+9vbrBPQ@mail.gmail.com>
X-Gm-Features: AaiRm52DzwyqScnSD_1lE5a2W4uRQaDkIK3TFFUruN1gvKxXkVMyOzXMy0U3Fs4
Message-ID: <CAGb2v67j91R7vsY2WOjgWQxyD-2Y8mRXe1go-F2jsL+9vbrBPQ@mail.gmail.com>
Subject: Re: [PATCH v5 11/15] hwspinlock: move entries from internal to public header
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

On Thu, Mar 19, 2026 at 7:00=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Providers need the ops-structure and the hwlock_to_id-function. Move
> these entries to the public header. With this change, all providers are
> also updated to use the public header only. The internal header is now
> used by the core only.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/hwspinlock/hwspinlock_core.c     |  8 +++++++
>  drivers/hwspinlock/hwspinlock_internal.h | 29 ------------------------
>  drivers/hwspinlock/omap_hwspinlock.c     |  2 --
>  drivers/hwspinlock/qcom_hwspinlock.c     |  2 --
>  drivers/hwspinlock/sprd_hwspinlock.c     |  2 --
>  drivers/hwspinlock/stm32_hwspinlock.c    |  2 --

>  drivers/hwspinlock/sun6i_hwspinlock.c    |  2 --

Acked-by: Chen-Yu Tsai <wens@kernel.org> # for sun6i
