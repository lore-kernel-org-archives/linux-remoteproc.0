Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2111FF7D4
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Dec 2024 16:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734368140; cv=none; b=tiLvlD44LvGmJJ/QNtqydsgNs0wxsOmSwhr3STjZ6Q/qLKLYmIMno3nV0386yiHBmSrB3+tlHyPNxW3TikLTVSv9LraEYnRvq1GWgCMEaXKtSgXpGBFeZJQnS9uJymz9agJAJOoooYrC7IovYfsz3lLLYwsqhkmPRLTgi26zGOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734368140; c=relaxed/simple;
	bh=exIcYFMr/HRpQfKDSPgzbZF56CjdZYovi5aOzoilGs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bzh0wPQHxAgq89CSLF+G+1BrC501wTIOSE3iBp81LkYhj3g1Pj+k29i83tZOKFvmBt9AfNubCa18CLsVZVxX9o1upfHEh/+6ML1BIw6NHUIc/QBGZ9r3fKJsPAMeqHXsRckBfsZO4gbftyFdBnM/UWXwFFmxnRIjL8IRFp0paYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U1gZwNXL; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U1gZwNXL"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3ecae02beso5683104a12.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Dec 2024 08:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734368136; x=1734972936; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5F9L8ao2FWg6tQlgvlzr46lLj33BvkE+wjWX2g+pmKY=;
        b=U1gZwNXL2jr6eJLdZsoBEh7ijUM41yek3w/7aAJzSlNiK/HdBiPb5oYyxuCYYfocZs
         Kf0CS71ryc1JK4rDOHtGmuzuXa9V/okp8ePDrgY2XNebXMn4El5annZW0uhS0HdM0emh
         wjduYPkUweQARQAazU7dnUXODkmiOk4SxB8vnf8zbfUqfDw6/9/OeGW5SOllDQtqr5mu
         Dovd8gAI2CMf5JM20MV3K8fxxOuLgqiqL6OCaU4e2tJ/GkztGaAbXGzO7qCnoKdsPsKa
         HgrMGqbbdNH2gH8H2WhZDB+LtyJaj6rh1tMt6W3/q9wQlTI5jqLuXQ8cXtl3FsbVqL/v
         ptmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734368136; x=1734972936;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5F9L8ao2FWg6tQlgvlzr46lLj33BvkE+wjWX2g+pmKY=;
        b=TuECaleKYNhVdh4HiEuPOGIXl4TliAggFgnlYqIxAGmhIHJVvryUfmoBdm1PWI4gA0
         Janj6yCCS1bbMmp/4nhCI8wV8Pxl6SbbTYBV+5wxTEUYIUhwGNn7hvAXfxRvImMD2ARP
         xhESjNImo1Z9oWMcqhna5UihX3IqRYOtwDbj14Dc7MOBh7gDEQYe+EUJ5qoX8M4FRUr7
         sQrNNWWkegm4wP77FhRI31u2gaywCXXdRAVu3goI0yh29FM0xYldo/lE8VfhuNkxCnGN
         o2lrh0Q/wmz020eJJPisEaaWtrogmrQnB11tK47+IciT/OXX5KEcXFXCSu7HQIW5lPEN
         GzPg==
X-Forwarded-Encrypted: i=1; AJvYcCWk0J3+UyphsokJH6/rkRFRZ9WX3w0NiZHGUk3pieGt519kAGOhXwBS7y/o6onNny7PXBSZkCv0SoN+L9WWuQD7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6tTpqp7jOrr1ZJ+upo8yIyEJU4EAUxU2V+LiDLpUk9LFmYiu8
	QBPPNVo3jFQhMNR9baWCSVzjv/dBc/z/GKnI2HNuW8WyBbdBOonX7XqW5d69PYiV15Ni8L7tmWk
	ZnskaEyYZ0KDB6Lp6GMCY/VLb2bv0A7S0t0zZGQ==
X-Gm-Gg: ASbGnctEss7FFvDr3/4Eeu02MI97ELQdvXPRzYnuK/ETu9gqfBW8PW9q91+kKkZnzSI
	x0+mHC2WFiLWQBDva0L6lkYfLp1OIYQx7Eqb8s89kAtHAOwxMMF7+bOQVeXMRnh0ucHAy8aNP
X-Google-Smtp-Source: AGHT+IHTRK/qYe6I9n70QN7A90ugOLz4h7UelfHoHHl07NZBTG0IUS3BQKGGrhwGG2+AQ5jg+1boyJI3eh0HXS0ECBI=
X-Received: by 2002:a05:6402:5207:b0:5d0:bde9:2992 with SMTP id
 4fb4d7f45d1cf-5d63c39fac0mr12471441a12.26.1734368136212; Mon, 16 Dec 2024
 08:55:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204111130.2218497-1-b-padhi@ti.com>
In-Reply-To: <20241204111130.2218497-1-b-padhi@ti.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 16 Dec 2024 09:55:24 -0700
Message-ID: <CANLsYkw+-VVgDrpS9n_gTpNPGzgh8QhwqF66Qz0UbyEOL-5p9A@mail.gmail.com>
Subject: Re: [PATCH 0/5] Use Device Lifecycle managed functions in TI R5 Remoteproc
To: Beleswar Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, afd@ti.com, hnagalla@ti.com, u-kumar1@ti.com, 
	jan.kiszka@siemens.com, christophe.jaillet@wanadoo.fr, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Dec 2024 at 04:11, Beleswar Padhi <b-padhi@ti.com> wrote:
>
> This series uses various devm_ helpers to simplify device removal path in
> ti_k3_r5_remoteproc driver. This is the first series in the TI K3
> Remoteproc refactoring as long planned since [0].
>
> Testing Done:
> 1. Tested boot of R5F remoteprocs in MCU and MAIN voltage domain in both
> IPC-Only mode and Kernel remoteproc mode in all Jacinto K3 devices.
> 2. Tested Lockstep, Split and Single-CPU Mode configuration (wherever
> applicable) of R5F remoteprocs in all Jacinto K3 devices.
> 3. Tested shutdown of R5F remoteprocs from Linux userspace and also by
> executing `modprobe -r ti_k3_r5_remoteproc`.
> 4. Tested that each patch in this series generates no new warnings/errors.
>
> [0]: https://lore.kernel.org/all/Zr4w8Vj0mVo5sBsJ@p14s/
>
> Beleswar Padhi (5):
>   remoteproc: k3-r5: Add devm action to release reserved memory
>   remoteproc: k3-r5: Use devm_kcalloc() helper
>   remoteproc: k3-r5: Add devm action to release tsp
>   remoteproc: k3-r5: Use devm_ioremap_wc() helper
>   remoteproc: k3-r5: Use devm_rproc_add() helper
>
>  drivers/remoteproc/ti_k3_r5_remoteproc.c | 86 ++++++++++--------------
>  1 file changed, 34 insertions(+), 52 deletions(-)
>

Please note that I am looking for an R-B and T-B tag from two
different people (for now one of each will suffice) before looking at
patches.

Thanks,
Mathieu

> --
> 2.34.1
>
