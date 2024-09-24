Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00AE137775
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Sep 2024 19:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727206306; cv=none; b=DazyLSspOBETkHtQUCXUF2kG+kiKP4A/QmdTbr2s93YnoEpm2PfoDZ8IBYN+yfnx0KeTyPtgwxJoGe2zjJoyfcTL3omAeTmffiD8rsrJ8pL7eMCw8SAJZAjlsuiLXvoS89tLIepf2TRS1kUi6FYZ0ByFYKQHPRnDkhZpDWTOdr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727206306; c=relaxed/simple;
	bh=mNzFKIMr4tsr5PKoLQ3M5UW7dlN0zeCTDohuqUPWGvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FIznSaeAtM9MrvXVtuX/UqZLG5A/VjWr+nbc7brJz6djS4pt4LntMPd/C6LcQF76TRcYUf91l4dTKM/0CpF5vhzqmRfzBYyA19Z2e7R2eB5Hc5BysUzZXsA2GsTyPOp27eEoLLiPZCnUtW+9tmRxXCMpMs7fA5AGkn7vBGQArnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KwTDYUMe; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KwTDYUMe"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a8d4093722bso506163266b.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Sep 2024 12:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727206302; x=1727811102; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/dLA+3q+2Raow4F8VzPJxYHtFvWf+R0tKMvdhGOxhyI=;
        b=KwTDYUMeYqmrVPRVVE+YlYvXJyT1K8lSSn/0iPhhpf35pt4WRU3kKBCZnFF+Dhi0T+
         qxXuzBPu8oVqGVO4eapjS7fNK/+ApIElTTVoxjs+RaTq3QaZ1bk+8XPAzkOFsNZJ27vi
         WEH1UOJzt2YF0oyfv2A4AFcljOXlpYD5+KVeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727206302; x=1727811102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/dLA+3q+2Raow4F8VzPJxYHtFvWf+R0tKMvdhGOxhyI=;
        b=lSVESk8TxYjIv2WHYtcXcxLtNBTIUEmVbv05aL956TtXtnbcJVKNJKFquqLUvnJKGi
         Gc1VCv7ufet/5wSCDO+Nv+jgk6XzeGA7+FP+IS2qGtJbu+Yg7DZ4UTi+Mpdvc7DL2n0A
         nd6vhYKUeTuvo0oKNfz5cPOLsVxhIWfuycPxpwwhizezlFVj0H2uHQjXx8NcPW1eIp6x
         WBJX38d/lYtxmMin+f1A959Tf6aDSseD6dRwLG+3FEkHK1t8HUuwvfiX35+U5y40czEW
         BllSinuOlO9hSIt5XQc3OIPaE6BVpHc2vnWAZyPozIPp5s7qsXLkaLRCdEhW7pM7eEft
         8CWQ==
X-Gm-Message-State: AOJu0YxAu//yQI+lhVxpRU5DRSQqmfem/m5DDTeFIflY4EuHHE0raAtA
	6adQD6TZIM1HCT54RmlI22762xN5tUYUZg6CinzV+0KcAkUjBccV+KigRTHSohkePiRxvVr1uYk
	x5820Tg==
X-Google-Smtp-Source: AGHT+IHsWL03UakmXDuC3XkP9bVFDfTXhXnJl9/gk1jhQtI1MteLxyfjIWvixYY9PO5ENgv2NxtL7A==
X-Received: by 2002:a17:907:724a:b0:a77:cf9d:f495 with SMTP id a640c23a62f3a-a93a061b82cmr26096166b.40.1727206302067;
        Tue, 24 Sep 2024 12:31:42 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9392f34076sm122960966b.7.2024.09.24.12.31.40
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 12:31:40 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8d0d82e76aso564825566b.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Sep 2024 12:31:40 -0700 (PDT)
X-Received: by 2002:a17:907:7204:b0:a80:d913:be07 with SMTP id
 a640c23a62f3a-a93a03e08ecmr34079966b.36.1727206300263; Tue, 24 Sep 2024
 12:31:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240924044741.3078097-1-andersson@kernel.org>
In-Reply-To: <20240924044741.3078097-1-andersson@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 24 Sep 2024 12:31:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=wieXpmx=+gEuhQSEEZLyQHFLDk5=59j0OtOF==mQdVjYA@mail.gmail.com>
Message-ID: <CAHk-=wieXpmx=+gEuhQSEEZLyQHFLDk5=59j0OtOF==mQdVjYA@mail.gmail.com>
Subject: Re: [GIT PULL] remoteproc updates for v6.12
To: Bjorn Andersson <andersson@kernel.org>, Martyn Welch <martyn.welch@collabora.com>, 
	Hari Nagalla <hnagalla@ti.com>, Andrew Davis <afd@ti.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Beleswar Padhi <b-padhi@ti.com>, Zhang Zekun <zhangzekun11@huawei.com>, 
	Naina Mehta <quic_nainmeht@quicinc.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh@kernel.org>, 
	Tanmay Shah <tanmay.shah@amd.com>, Tengfei Fan <quic_tengfan@quicinc.com>, 
	Udit Kumar <u-kumar1@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Sept 2024 at 21:44, Bjorn Andersson <andersson@kernel.org> wrote:
>
> remoteproc updates for v6.12

Grr. I didn't immediately notice this new Kconfig warning, so now it's
in my tree:

  WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
    Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
    Selected by [m]:
    - TI_K3_M4_REMOTEPROC [=m] && REMOTEPROC [=y] && (ARCH_K3 ||
COMPILE_TEST [=y])

this happens with a regular "make allmodconfig" on x86-64.

This seems to have been introduced in commit ebcf9008a895
("remoteproc: k3-m4: Add a remoteproc driver for M4F subsystem") that
added the TI K3 M4 remoteproc support, which does

        select OMAP2PLUS_MBOX

but does not actually contain the proper dependencies that
OMAP2PLUS_MBOX requires..

It's in my tree now, but please fix asap.

             Linus
