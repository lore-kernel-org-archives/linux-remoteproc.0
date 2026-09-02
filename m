Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B807444D020
	for <linux-remoteproc@vger.kernel.org>; Wed,  2 Sep 2026 12:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351186; cv=none; b=A+8WuMVWE4+f3Txw4aG09fckbG8iLSJmv5H/ZFEK5xDkHr80ZSUw01fubnpxyJJQ0drbCW1/lQseGz7atrYVEZ33Fns5FR/qyR69S/kPBuQ9T8uIHjg7TMBUfD8SkI3vTL+v/e4qKCMlEQ7ECzN3SOmKbkfujkupFdBJezxb688=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351186; c=relaxed/simple;
	bh=biV/P6Lenk1gqyuDluawNcA5WadE9fBB25bM/uCBA9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hrglxNAUg71KxvHG4Ik+MPilyJ2GHTTKTQ4laCR7nmjbwcR0y+uBCo08SCtEWiq6nJMq3BUC0JTdVnLG67ctrso2UguQ75X6IfgPoQStCM7M0aMVY68sZz3Kb3MXHEEDm2S43hVZfuAXbRVmNGFgo03nz81WCfmwd1CcZW7NSIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-754ac74c495so389252137.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Sep 2026 05:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788351180; x=1788955980;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T41eIf+/AuTT/wyzLNOdOWtrZpKK7XdhLj5//SaN8yw=;
        b=J2c3qiEMs8jxCn/U4C8QWynbvkyc67DPj5qcsm5VaPKjunhZCN6up+oCO34kvfKRGR
         wzoJwGVFFqKZGjztGWgw/nyGeYXo1Kh0QPW0LuRmmpnjmtFAn7BGsMq1i1/Bu0Ac3UzL
         Hll1otE2Y77CtgoISUaSQSDVgsrE+tCuxsHZ2C0KenpGWu9I6/34PVzNQh9PhN7CXpDn
         dRTCzvvhW+uEIYRdka7VLSuWhmu9/GnJtBmaHfXz/AncjsftLkHicllnLTGwCcnqxCtE
         H0u9hSmBpjLISlemKXfiRkQnYjbDre2pmNQj5idW0OhIAp6RgYxwY+djhXi8D/VepV09
         yH2A==
X-Forwarded-Encrypted: i=1; AKwUvBwtXlFYr3IUn/MlbuIzlwUaKSz47sjf8cXDDdON95zsIRVQQe+s4lzUyNnhMgyMJGjVu5xl/W43JfoKm0eGh0st@vger.kernel.org
X-Gm-Message-State: AFuF++n4F6MDDjmj5m8ANF/7eneXmKDHmuptf6Kqpz6IgJheLqeyEUP/
	mj90qQqEiGsu0BIZuyyCJC+Y1I+mkBJUduZVsyKU5dO6mwV/A40Vzi1jGY7RwxZs
X-Gm-Gg: AYBFou08k7esD7OM4MJzqB41seIG4EcpUw1fieOLCPwjN1fkKCoYMZaRYNp2euT22AK
	bkkfYpNjYrenUiDh6/MTrrM+Geq4PE6+yJ+ROvCkaJWXl50CIYw+r5pSdO8P8O9gfDb0yWMj0xS
	j4CcU6K7r8Rvm01I3zn3eof6BIvg4Pkwvj/noUIkQViR+XcO46sr5K6POPA44i7vh7o2U2/9YTV
	aLe4uKxnQ/vHOW4jte8MOBMKnFoDxQKvmtag1wf8CmPv6SWPLALFnYErRoznPnsy+gIfhgoS8SK
	TpD1ejepw7WRm2uplAKfAYLkvtoBYKzk5RPosfzG99eUVxv8x7cueK+PN06rbpODwFthCuaEIRB
	iIuRwd9VEni+s/KAf3VgJgiOVBxBQHb7FU0QYUEpp4uTwpPuVItgxZ5temjo64/35dbTzpGNwbE
	sGfomVFwhUxDx57cIASkFyIkT4huW64QkQtojCHkW7Fm+snK6gvW4iIwWuA63pitDf3lPr8Bq12
	oWtZUHeWayoGfghmr79BF+0rw==
X-Received: by 2002:a05:6102:160c:b0:778:5369:763d with SMTP id ada2fe7eead31-78a1f19266cmr1137190137.1.1788351180483;
        Wed, 02 Sep 2026 05:13:00 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7cd73a0c1sm1816915e0c.4.2026.09.02.05.12.59
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:12:59 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9773c6ea885so344961241.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Sep 2026 05:12:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByPz2OnigRT59DxcSwO11JR37vrYGKdvOa/rnmcNDM0i/pogo26V/fXgrrV7Ovx5vlQWEV33niERFohHiGw2C+z@vger.kernel.org
X-Received: by 2002:a05:6102:50ac:b0:785:c643:a415 with SMTP id
 ada2fe7eead31-78a1f3c8040mr1328620137.12.1788351179542; Wed, 02 Sep 2026
 05:12:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817095447.34693-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260817095447.34693-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 14:12:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV3OddS_FLezhLKL7Bfrw38PFAv+pNLvza5wt4bE5kP1w@mail.gmail.com>
X-Gm-Features: AcwNN1Xk803m9jEyq6713qOsrpmGtrbWsrTaCapprfgM3QHihPSKQL88K_Gs8LA
Message-ID: <CAMuHMdV3OddS_FLezhLKL7Bfrw38PFAv+pNLvza5wt4bE5kP1w@mail.gmail.com>
Subject: Re: [PATCH v3] soc: renesas: rcar-mfis: add hwspinlock support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Mon, 17 Aug 2026 at 11:55, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Every MFIS instance has a block of hardware spinlocks. Add support for
> them. Gen4 has only one instance, so the base_id is always 0. Gen5 has
> multiple instances, so the base_id has to be encoded in the info
> description. Also being a provider, a hwspinlock-private header needs
> to be included. Work to refactor the headers is on-going, but will need
> many preparational steps. Until then, we need to live with the special
> include.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v2:
> * dropped patch 1 because Geert already queued it
> * add comment that flex array must be last (Geert)
> * calc local_id in a less scary way (Geert)

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Any feedback from the hwspinlock people? Can I queue this in
renesas-devel?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
