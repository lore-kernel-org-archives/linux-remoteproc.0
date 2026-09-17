Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EA23B71A2
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Sep 2026 07:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789630825; cv=none; b=kP99g9HZ5D5OklpMO6G7vf5ewbVjyk4UB3U+kNp9R/OUHAGRTYbzWi00NApU4IPD5vftymvvJNwN+IrTuk8KPImLuV77dAReUYfGwz3YNSP6KJQd30DEbQ8I/Gdr5CGXVCBGar54PgiaRC/zWjU7fz7F+bqzRxBEWqyGajNVvNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789630825; c=relaxed/simple;
	bh=Eae0L8mQX/HKRxUW9H1daR6Qu5pY1s+6r4QDDDv3MFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L6Xs/BhZF83ZjDbnXZQwCAhMUUbzMeUE+Oc3GiQdKvr9s/Xk2B0xk3Xc6g86tVljJmnhSOzBgtREunbSYmVhqHytcxp9aicPsaUIlbk1ATIYC4YFpBfoKNmDDr9ogOJr0mNW72EUmj0T6NHf0IJxwn6jKpJzPmkL3d9T8IbC6Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-790ec94be85so194476137.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Sep 2026 00:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789630822; x=1790235622;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gAuDoBRaqindrDQ1hoRg/L72SkatQaOp2VDi/OWJcsw=;
        b=oIQuiVcjH5T6iCrVo1OyRR+LDtKbfD2TBD+AiGuEKoHxQM5Dc56NorHZiBskHGCGlG
         jnAZBDspEuHEVJPlJkm5VmAPoGSbLJBbPviyp9fec7SNzq11FNCGY3daCbVsE8ccoP4d
         nThHsPYoNusTOxTTi0UrADwzc93ocG9HMPWySz6PUQvgOCUClxpRl1xsBYRrhhKW0D1I
         PbpmjSRsGMpB3Ww7GhebigedL9ZmiBboOzdlI9iGnINvlkvYkYyc18xrFEO+Jsa4CBhm
         2l7SZpmmtGrNxyC1AIx6naaUXpiv/dSXSs6aEpgAWIR8l7ADPBMmVAjMEfrXt44CYmee
         7qjw==
X-Forwarded-Encrypted: i=1; AKwUvBynUsVIAQ8SSNqAXfROx/+IJsDSUAg9JqQjoulFzCAD6WmLfMXlpvhfc9xPws6ajN52HTGRoki7dyktFz4O7qWZ@vger.kernel.org
X-Gm-Message-State: AFuF++kQkwJ+USUdbJrW5I563I90L/PA8xbC7pJaVrcWw0UmGos62ZzR
	BSblYsQEejV7Tb6IAB+772Eza//YW2GQUxTUilMUAnshLEIAz2fc2YLTRxxmO+Ls7YE=
X-Gm-Gg: AYBFou17cj4BfJLEPVy3uv5r+Nmc0G4eYv489wJMZzEbU3KQytDJh2wSE2s65fKZck7
	1vpWEaphxEiUv+0NWlL00VrgpODJQsW2s8PPi2VVRJdWMa+vFPsa92Xsvg2GZCgqCddrpA4bXpF
	MAUrD8qhLPMb21M49Sr2FWH08Zys3fpR4Jt9ycWZapSH8BxFVsvvauLeBEKj14wUfSUcD05CdH9
	JNcUNnIxgUbaejdjHK9NW21fDvvR7rqWnI5B/7D9yH5BUVu75XNDzMC0IQasFqBEY+0sKnTYnCC
	/cSlRnd4wil3HQ95JL+NmkNHST27Axhio/gbZoS8bk+lJYd41LqK4WfyUlcH/HtLUoVUD8agXJ2
	ywWL2uISAq9O9Ci0vw0Y64nCjDNwTYfEgLHZmGxhTTuEUbOYmWfETuoE+YOW4QsjSzM2IsZDkIF
	mcUtwDzJlTxaH/Yd5stAuYJAN5p6YRHl4Kxw7y4y4yGcQ5zuVjqfFN3U8Hvs2aJLLyUAGuqZzkI
	mUqukbkIFMjs0gTo0A5RRDKapx8j0dSeedg
X-Received: by 2002:a05:6102:548d:b0:7a1:f951:f302 with SMTP id ada2fe7eead31-7a1f951f55fmr1474534137.21.1789630822182;
        Thu, 17 Sep 2026 00:40:22 -0700 (PDT)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com. [74.125.227.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7a1e292ee59sm2481807137.6.2026.09.17.00.40.21
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 00:40:21 -0700 (PDT)
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c9031e714dso151291e0c.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Sep 2026 00:40:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx6gfNECOn0XOEJarM2nLOtDk21oJJdCSsW1IK1eLHY24gR3W5+iIqizNbs9+LEZccYWvOyEpYW12MuMacUkc1P@vger.kernel.org
X-Received: by 2002:a05:6102:a4e:b0:7a3:3d26:5c4c with SMTP id
 ada2fe7eead31-7a33d265f35mr120142137.22.1789630821198; Thu, 17 Sep 2026
 00:40:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912191442.99453-1-wsa+renesas@sang-engineering.com>
 <20260912191442.99453-3-wsa+renesas@sang-engineering.com> <CAMuHMdVbYaUXiW11j+LKSuSaLLF2PRR2kAFsaj-ZGsx7nNjK-w@mail.gmail.com>
 <CAMuHMdXcU3Eebhb3aS2PFoUdZsK=cmU6sjAFWhMRiPB9eczKhw@mail.gmail.com> <aqsMWn11lSgnNuVR@shikoro>
In-Reply-To: <aqsMWn11lSgnNuVR@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Sep 2026 09:40:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXzyn2-bkky_wEC=5DdNFYo+QSroP3gEdmuZ6bhqQC0vA@mail.gmail.com>
X-Gm-Features: AcwNN1Vf8usG3tBt9wHCjscRiFJe7JD7786vCcIJCLuucE8K5jh9OFuAaTGdfmI
Message-ID: <CAMuHMdXzyn2-bkky_wEC=5DdNFYo+QSroP3gEdmuZ6bhqQC0vA@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] hwspinlock: add list of locks to debugfs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Wed, 16 Sept 2026 at 23:38, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > I have been using this since quite a while on R-Car X5H Ironhide:
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> So, this applies for patch 1 as well then?

I don't think just booting on a system with a single spinlock
counts as a full Tested-by for such a complex conversion.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
