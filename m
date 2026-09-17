Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B953B42E6
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Sep 2026 08:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632656; cv=none; b=mKZWOIg/nnyEyxD/k2JDclTu7kt3tS+Ol7dsEELKzt8RSfseBYYAlijo2rhTuqFx1PzqQHxuZRCNHHjc+rVBERjBUnzucSlQKDwL2kC2C8bOdfy4SUWyGYDssy79U2+EuP4EEuHHlJsbwBWiB4aUqLw3BCZ56I7bar43QTVkGaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632656; c=relaxed/simple;
	bh=m3YGZEy09yRgJ2JaKzPyUPdH8tTqM2R2o2g/OwqIHvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=adcMof6PtVnGEulopwvVEMQf6YxErCtCrEYoSuxOsfTXjg/59RSTnv8rOPAgPPS3QfVQ+qdV+X5VijXhm7gmKn4pCw2liOvfZ+nqb6LwTxUyJfC3QvKUwvpldh44QytpDOHZBZhguh151saEGilCgDTImiqbhl0Ni1MUAkQ3mfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-78fb1fb9508so477518137.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Sep 2026 01:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632653; x=1790237453;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/n1V6C1SyVBCThBez7rg4ybTZbuRI23DZ9D8Q+s9AMA=;
        b=YTT4WNVguRIwHjX7Nsyu7btGETmmNBB+I7hoyKACCAJHzQHOyxe29X9gDJpOJZPfat
         TKa4xxk9AbKVPtoh0k6hDd6OgpHfR3kUwNQP0or6ehZje9r2zxW39bl+lAg8AQ3fCbjo
         u/9gXYpfY1ClcAFgx3E06fT4XdVCnQPp3XhLTdpMf2K6Gj06RJNp5PiWS39OvXIvd9XL
         58HHTUKv3lCj18NbaxOlEmcUfdmMGHzS3I+ISLpmd6hw2YvxFcx9SKnFou3WEri1ChIZ
         6rXufrw7s2KIuyDZ3BfmvhaWAozb6Yc23c+SrrQyvpX/IMNZRgmMc8xi9hTLq3AvPxN3
         HXqA==
X-Forwarded-Encrypted: i=1; AKwUvBxxuPHPvwaX3EYPTuE1RVTdgGjO+G4mFm+IZuvlDsRHkJCzcfnssysvcbJL18CIewETn1IhAttjoVspXfuv1mPX@vger.kernel.org
X-Gm-Message-State: AFuF++lcZHw65L3YDQSycSeFpYw94upWbwoZuEatTEmqHKlEVNQq88UG
	0A5wi8rF8sJAAAnZDY82yVl32cHDArcc6bIs3CdNqpeiBUaz0KAQ0Qz5wwW5kNAKi2w=
X-Gm-Gg: AYBFou2wSuW4NQLBAHMgjV1efEp6yR6+jg261uPdH2AdqHOLPAgDKx5inlNQqCNUkHf
	Sw8Xv+zKZMv2XHUsRUy4zq4qi2+HRwC9f3i36zkX/fw5GyPwGWZ/LibiLhQ/AcKgNaFBw+O4fY7
	hPOTfQl8XY65EYkmbWak0PkYvW8VbDDvV0wriuuJ3CYgJxWkLzJx69b1Xhsj4NREzeaczqsbIKv
	onh02oL5TC8WUywyqoppHxVeCFfqFbBREsRTgDPA5vFR6YI22D62xiX0OG5APxPhgpcJIa4S9b/
	of/SAI7m2u/KQ56JgBcX5lxqYpQK2tlA9ZBuKgj2GThL8udu2OEXqz938A+mP3zsJ5hwpvtBUxk
	gqqY6DchchLt4kYBHE0WTP1Yoly2LXUZ86SzRjWkFLee5yiEX4qIAw8UPU0iTuFAhAsO9lFcwlF
	rwERbQK7vyXgROTgzMFREBUX2VWim2YNC5ux3441VOhbtPRe40X7rQ8eKixrcpl890ujb75Nir4
	iKp5DKBq3P2skCBdaoH/PTyd7AQUT6aNfV1eZ3YTHORoLM=
X-Received: by 2002:a05:6102:a20e:20b0:78a:4dff:7b3e with SMTP id ada2fe7eead31-7a1ea1249femr549832137.15.1789632653237;
        Thu, 17 Sep 2026 01:10:53 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7a1df5ee23asm2579633137.1.2026.09.17.01.10.52
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 01:10:52 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-78a338fe106so528473137.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Sep 2026 01:10:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzEApdN6M7802zNz8xlRMYoU7vR2V46UUa9/1u/7tlbtXtcBXVSLnmXVzgb6WTiEgbqxcNK4o1y2bUrQD6RsXKt@vger.kernel.org
X-Received: by 2002:a05:6102:a18a:20b0:7a1:f2b5:645a with SMTP id
 ada2fe7eead31-7a1f2b564f2mr452263137.23.1789632652708; Thu, 17 Sep 2026
 01:10:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912191442.99453-1-wsa+renesas@sang-engineering.com>
 <20260912191442.99453-4-wsa+renesas@sang-engineering.com> <CAMuHMdX27+sdJYd06v3T9hj2=z3ADSKOVGvu+02-qe+Jp6R4Bw@mail.gmail.com>
 <aqsNpEXjuZswCC9w@shikoro>
In-Reply-To: <aqsNpEXjuZswCC9w@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Sep 2026 10:10:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUPcBfFrLLW9_URM99S1jR-KhqUBQo1n7oHqX8qL4=1-w@mail.gmail.com>
X-Gm-Features: AcwNN1Wcf_hW5MJVX-r-TSDH-HlDt_qd0MZzGiSdL1Dk0dN2d6j_lLw27_H_CyM
Message-ID: <CAMuHMdUPcBfFrLLW9_URM99S1jR-KhqUBQo1n7oHqX8qL4=1-w@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] hwspinlock: add low level debug capabilities
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Wed, 16 Sept 2026 at 23:44, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > to request, free, lock, unlock, and test hwspinlocks. Because this is a
> > > potentially dangerous interface, it can only be enabled via source code.
> >
> > ... code,
> >
> > > Similar to writeable attributes for clocks where this idea stems from.
> >
> > similar ...
>
> You mean I should merge the two sentences into one?

Yes, as the second "sentence" does not have a verb.

> > > +static void hwspin_lock_low_level_debug_init(struct dentry *rootdir)
> > > +{
> > > +       debugfs_create_file("request", 0200, rootdir, NULL, &fops_request);
> > > +       debugfs_create_file("free", 0200, rootdir, NULL, &fops_free);
> > > +       debugfs_create_file("lock", 0200, rootdir, NULL, &fops_trylock_raw);
> > > +       debugfs_create_file("unlock", 0200, rootdir, NULL, &fops_unlock_raw);
> > > +       debugfs_create_file("test_lock", 0200, rootdir, NULL, &fops_test);
> >
> > Perhaps just "test"?
>
> Hmm, too generic for my taste. In fact, I think I should maybe rename it
> to "test_single_lock" to make it more precise...

"test_single"? All others don't have "lock" in their name.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
