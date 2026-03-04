Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775113B895F
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Mar 2026 14:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633478; cv=none; b=hm1IBfhhw4rYt5EqqIS7FK6BhXsulkk9a4ScdJoQxxRv12Q83e2OZuABFQkC5h7tJj8fNqyhqCoR5fQxNU9euNQsIdpwUmb2fMPK/Y2c69+2Cjf1s7Alwu0C3M3aQf+qNGKzLH0nPf7v0QPTEbIwMiGk5s9xa5/8wYTO3oZVTr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633478; c=relaxed/simple;
	bh=RRD82glsj6nOntxvtcB/gUHxdV3IX5WvC/uNfoVC8Bo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aog7rzj5cIGYMTDAwqcdZB+5ooFNeqg2gAxjhVfoHX9zJ7xivpGgC9cGKLR7nPJuaxsEsL+0Q3OTqdzBd4cOBMd7gBQNhw5Zle2tfEAlHMJxW7krgRBJUR4V9dxbow5Z4D4P7NzTjj6h7SE+Z/L5IYUBVkANPRoRLB7mxGRHzIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HjwpUZhO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HjwpUZhO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 302EFC4CEF7
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Mar 2026 14:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772633478;
	bh=RRD82glsj6nOntxvtcB/gUHxdV3IX5WvC/uNfoVC8Bo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=HjwpUZhOiHy5YjL40RhBG3fdomNubKi5kiDja9gd8xIT84wzMdXAYDmZ/9KZGKaba
	 G8fKqNlelm/1sW5HoG31CZJTMqJ+jPijG1tHdW+zj8dPDlM02gJ0OOCkTxefmYpWqy
	 P0PjgXGWwHZ2iT+hNW2N2neMbH4ygfBvfwx4lgFkzmgSezQz7JVgehnzyKkmfnVfxo
	 vPIkK89KL8t9Y0awS03Gx+PR7QAkT8MJ+otrgWFgY6JkcDXagbCKZK60KGhSudYkXv
	 9Cd6bkaU4DGesvtwMo/VeF3UfvCd6m9U0Ri9dpSn9RUuW8Jtc9D7860tdKUAK95RLV
	 IoBpl2v1hE0ig==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4042fe53946so837725fac.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Mar 2026 06:11:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVYdhmaIFAIxXHjPU8NDTn4LI6+fq/qJdvQUFwvQrzoBLw3WSE2vSZSeC4bIl8juJe8Y6f9zQTs1kTCm7Nt4UCz@vger.kernel.org
X-Gm-Message-State: AOJu0YynWlXVS6ibL52Al3t9x6dv0IqjLVcvpJo0wFoTdLg/IDoAL0w4
	40IvzUEKiBkTcmH8vu3+2EGMBIu1zQhesXRc/PYSj9fSE6wR4ueudbBOKyiMuIgPdv6jKOb8GXG
	Yl4M0YL6fGOxoQXn779HJa3UdXuZSVik=
X-Received: by 2002:a05:6820:16ab:b0:679:a650:cc0b with SMTP id
 006d021491bc7-67b17762deemr1124355eaf.51.1772633477338; Wed, 04 Mar 2026
 06:11:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303192600.7224-17-wsa+renesas@sang-engineering.com> <20260303192600.7224-26-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260303192600.7224-26-wsa+renesas@sang-engineering.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 4 Mar 2026 23:11:02 +0900
X-Gmail-Original-Message-ID: <CAGb2v64Uvd9R-UBvsK7dH2FOAFy5LiVunj7eK3xXX_MYZBwPWw@mail.gmail.com>
X-Gm-Features: AaiRm51UKZgMQvlJkBBvuicIHC1NRc6PgGvmlvXLPvJenUPydhv9dgHS9yfMsTk
Message-ID: <CAGb2v64Uvd9R-UBvsK7dH2FOAFy5LiVunj7eK3xXX_MYZBwPWw@mail.gmail.com>
Subject: Re: [PATCH v3 09/15] hwspinlock: sun6i: use new callback to
 initialize hwspinlock priv
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wilken Gottwalt <wilken.gottwalt@posteo.net>, Bjorn Andersson <andersson@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-remoteproc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 4:31=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Apply the new helper to avoid using internal structures from the core.
> Remove superfluous setting of drvdata while here.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
