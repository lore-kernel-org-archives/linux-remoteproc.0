Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A77944470C
	for <linux-remoteproc@vger.kernel.org>; Mon,  7 Sep 2026 08:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771139; cv=none; b=syoH8t042ZrhfLX62aczjMS8RB/lwLM6MyHtgDRymuDWjwc4DCQzOzuu1snMUFG3pKkyLqjgWfsSVTJZHT8J6uJ2vVmu3jH8vN/A8tj4rlTe7M3FwA8ntPVAyB2z1sB5xak1gxX4WIkN/RITn2I0g6/U3rZkC4oR0B5NzcZsQnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771139; c=relaxed/simple;
	bh=5hkNg/DdppWmt9hRq7+Z94tl0DqiwznZATxfNYQvFw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DlJ8YhhKOy1WVDmrLpXQIDhEjfHRU0DlqMY0AnbMmKxHMk0Jy9HvvjIq0pzuHYSyAVSaQ42r+108sczOH3ssiIsRu5CimWYHoUx9ZXTlgsnbleHgq4q1lcHCaf1qhuwx7FwQ5l2EvLXU9kdYwlKVlYgVwoxV3nI2mOMD/azfONQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c7d65c83feso3165509e0c.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 07 Sep 2026 01:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771131; x=1789375931;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q+3r2vTpl7vurYEZDFRXrOxst0eBJYiAPGsJmJC4qoY=;
        b=o+MFFMbVhHYCg4V+plmYJEFtvSr1BZCF4lcsH3CFGZNo4s/uf2nZLbpk+CcqrXZtFt
         IAwawwnwFOpLkcDiEMa2kqRu5NjDFSX4fZ67yd+/PxZsT6Pxv0LFuGu5jNbyu1AuWTnK
         8u1f9jZC4W/JGvAgk7jCgDqbhFcogW/31h+fVjMcNIDdhukgXuBX49wTtw7ZFpYlOTmT
         ZO3abTHteIYmmtlEzt03+fwOajMIFSU8nPCsi3OZeAwv7g2l2BaDQePXtc5e1pxhGArz
         abg8Le3dLDqBg9xDRYdKaEvuv+dC/N5rrxa/bYRm95x6IkKiQb7vqiNDp0Q8sFTgwHc6
         VlJA==
X-Forwarded-Encrypted: i=1; AKwUvBwQbn5ft25VVlniHemj/lt72e85cWAohtiby3Wcdn5nV+XgBbOu5s91iMM6erBvjm1ghaWx4PNKgtAmLzdMIJri@vger.kernel.org
X-Gm-Message-State: AFuF++n/f1AmZ7ql+CO9o4qGyqT6/BXdGfgGyTCymJQCmrf7njVKkay6
	I5gLsP1AB+KU4Qhq9e8m9pU+kNIUzB/oUsNPxTtbVXwEwVowmY4yB/IRpOpHBW44
X-Gm-Gg: AYBFou2rjZn58KgYruR1b412VmOHDeP5II67C+HCijQ+WuWgcuO0Pz1uZTpVmnfqCRh
	xy1zUmRBm7VzbM9noIQ02LpAPCqWb/6CcLK1LPfuqeXIw65lLiUc8IQGr4H/xT/LrMD+jYdagGz
	HCKHmBaj1yDvL+yviNN/JdhRlQHF8RhZml0ckCaSNKZCN/FZ4eg3jeccdpNWzWXvIc7PMmWo/wd
	Nmt9kJB7+A96n8qgjRbiynvm/jB7MYjH0XtDPwwvFaazzArysTw/NZJUF3OaFExfbmSLMJIap4E
	cmfDF63STcCNomlr8aV5idEE/T5CnsIUuvOq3j2GyKU5etizxBUMW5E9aLVgGRBluQMk1MD0TvO
	7wmE9LdVRPkkknjhZhA910CfJ+2ZUsW+FOtToQs/AHPzxwuszu26h/5tbf/iJr484RkXjPkpe7Z
	lFl3tkGZtkuVbwcq08f0b98tg9/8vi74ZP0wpHntEL+qgWbsxfvMdDQTkBiMApm792Y8LO2zOhp
	rBKqsSOAl/lkL8A08H/EMfJmQ==
X-Received: by 2002:a05:6122:2213:b0:5bf:9bfa:53a0 with SMTP id 71dfb90a1353d-5c7ed50c3demr11540542e0c.1.1788771131130;
        Mon, 07 Sep 2026 01:52:11 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1097e5sm7421547e0c.2.2026.09.07.01.52.10
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:52:10 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-77bf3334d14so2253769137.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 07 Sep 2026 01:52:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByJtlGImWxgKk7qe1ZnZRLdvyB7XGVbb7CEiO1c12pB4GpdwsTFC7y7GYyIcQYs0bOyi5thWNlBA4iltg3Cnlj+@vger.kernel.org
X-Received: by 2002:a05:6102:e0d:b0:789:5b58:e105 with SMTP id
 ada2fe7eead31-78a4a90fdd3mr9303394137.2.1788771130230; Mon, 07 Sep 2026
 01:52:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817095447.34693-3-wsa+renesas@sang-engineering.com> <CAMuHMdV3OddS_FLezhLKL7Bfrw38PFAv+pNLvza5wt4bE5kP1w@mail.gmail.com>
In-Reply-To: <CAMuHMdV3OddS_FLezhLKL7Bfrw38PFAv+pNLvza5wt4bE5kP1w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2026 10:51:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVL=+ZJbiGAhr8ydMhtZpXS0VXB4HVBccPLi8tbmQibVQ@mail.gmail.com>
X-Gm-Features: AcwNN1X9BL8rCmnu3zIP96gRaaLUUi-0Pp8fmnpm5GVndMU9NzYXjg5-zqHMACY
Message-ID: <CAMuHMdVL=+ZJbiGAhr8ydMhtZpXS0VXB4HVBccPLi8tbmQibVQ@mail.gmail.com>
Subject: Re: [PATCH v3] soc: renesas: rcar-mfis: add hwspinlock support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sept 2026 at 14:12, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 17 Aug 2026 at 11:55, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > Every MFIS instance has a block of hardware spinlocks. Add support for
> > them. Gen4 has only one instance, so the base_id is always 0. Gen5 has
> > multiple instances, so the base_id has to be encoded in the info
> > description. Also being a provider, a hwspinlock-private header needs
> > to be included. Work to refactor the headers is on-going, but will need
> > many preparational steps. Until then, we need to live with the special
> > include.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >
> > Changes since v2:
> > * dropped patch 1 because Geert already queued it
> > * add comment that flex array must be last (Geert)
> > * calc local_id in a less scary way (Geert)
>
> Thanks for the update!
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Any feedback from the hwspinlock people? Can I queue this in
> renesas-devel?

Queuing in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
