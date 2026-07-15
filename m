Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B834508F8
	for <linux-remoteproc@vger.kernel.org>; Wed, 15 Jul 2026 12:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118326; cv=pass; b=EG0CaekFSW2EA1T1a0x0ewycTR29HahotSbVxNCcNwkKYDz7+uvpnGn23ysgeVVh8hRDd0+MBs4ccogVPmeS70Nze4sAoSu+I6ZjqHk/qbL3O7mLYfZ5QGy9PArPfKVCR0D3UTH59F/+djk+DpUcz9t0BRQPse92kW8/yX2tCI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118326; c=relaxed/simple;
	bh=s1XP3CBX1vjLoCZEqWTUBRju6xstvuxvI2ntg39GLR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IwQINXy1bTzgIUluye1nxFNN+C1z7CIGED5lrk4rYy5MUcTYn/9QvfRVUiMkA6PUTA8WANKaMOUD5XJYMg45yKpdnfcPJED9VbFmCyZ8/+/DYSPRwIlRRtTtvWWm6hMrDJucUGvKGWHixG/aUNCxgHujvBvxgJhJRQf2Rc5hBXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nmd5qbkr; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nmd5qbkr"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39c8dbf4f38so20012011fa.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Jul 2026 05:25:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784118323; cv=none;
        d=google.com; s=arc-20260327;
        b=MLA9faBWeYY/ro1ww/IaFSuH+AcND4Hjk7+Wx76dQGQjrO67uxY3sMCFYohq0Ey4z4
         /VMcORrNfPEPGjXLRH6N+d7fvKgZ3/aDN7NoVHdbm5TGkljTfarPJgyUXqHS72UhEj7S
         5ecoDv2uw4BjnIxOZ3m7Stj3llxjhEiU57gO2v9G3ke0+EMtkxEDUHjSbiHpW3YJuz7e
         U4Q+PLH4FCqRyTBklMTMLLsSPap39p7SyWLBa5W5fuXE62ypHZvGTSL7X4DJCnv36YEF
         27fpFliGV+vpzQKp5aAy5Orl1om15CpXtPqFkBfh8VKatwQuTdzwFvU9DOmRcG1Q0v66
         ec2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=phmAAV/S+5KnjhMYpBu8jVRdoI1pgmVSU2EZUZpX/q0=;
        fh=5yKRW8REYSkPYUh/Jr85pyWd2iWsxj9kEhBkOO8dFVk=;
        b=SLRsnui6/ySqHOZ/c+6EJdopQW3Q4oAQhtPWM6i2J5xm4JXj6bAiliLQT8dJ3mZ8uR
         UKJE5Q5BL75Gd/tm1TYgyEL29D3Fszc/FR0qLDWmki8r/5Ti9tkyAoqVjuE97vEW7i1Q
         N3X+d+DaDvrTc9uKq6IgIb2+95mnzrolRJEZns1vqlD5Bkz/W59ADo3jE/kuEqkQlFyy
         Kt1ASCeWVgHF6Fa6tAClTFzkoJBaR2plTSvyEKZIDBjtbUmuGC6YEuyk0aV6r7zXGAk7
         AXDkTCtcN2RDisyDYKwMZ0zD864IDxFGOJ7TIxmc2W/h46Fc744kFkfR2j5a81923rjT
         arMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784118323; x=1784723123; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=phmAAV/S+5KnjhMYpBu8jVRdoI1pgmVSU2EZUZpX/q0=;
        b=Nmd5qbkrQU1E/3wSaxS0GjfkyNQPU/XKhIN0gqXHgslyspryt/Ry8Qeh3y3DUvwToD
         xtL88Z5iqc29xv5Lf5VQmdGs/hwfJ7GMSjZa3ww0Jp8xdG7wZB3M/Wovsuz8BxAfY3P+
         XRWbePAgM+9J6wXomvVr2AUmTvsFA/5ZmJkzw9MYkC0sD8Ye3Oc4MI2WWOHFJEe6r0tH
         kqWH+i1gyku9/bsUMfgktvZ3PbwNJ01N9n36vcsi3l6266boZ2T2Xxpj/vptRSRy/8Bm
         DcleDt6cRa4WBSWevcJXlf+JVDmZjremtqQZP/qzkcYSrKLrlYW5mRbbItDD6Hn4Kdtx
         q8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118323; x=1784723123;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=phmAAV/S+5KnjhMYpBu8jVRdoI1pgmVSU2EZUZpX/q0=;
        b=L/k4QsLNNxTCYcy6ubEIdpoGl++aUwwXOeY23wrf8PMyjb5QA6bI6R91FX2Ix6PpL9
         I0H+L372bv71vEjdDnQ6ORi/c0HYoIYhzaWfhUMPlVLxGiNcIU9KBxs3I62KeUlUuMrV
         ophFBIDGZLe5YmVhyWPgrrByr+/AbEpfv1MovkaQFlRerdUMefnTvg0nYEdJOm9FPb/E
         5JIbK01dc1x77M6iveJfYNwaw4fIUU2bWJfAiekmozYg/W6yDGZOF6OZYWpU3j6tGrMA
         FhX+Obx0SR+kiszXKVNh4rmjpp+3MfDyvTJIrN0Popb0PguYSK7ZO984uo1TDCdb6W+r
         vAIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr0iTUrOgTdLqSxzjZD2C8U4XL+RXonWiKcWKTh2asfMP72wl4zmEMan6Sv9hnrAmuVmc80uCEHfvjdPTn/ALFX@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc5kjj9uQCYzAM+v9otwUtLdUGcB25h+hTLFkrfSOD2P0FAcXQ
	sqX8g10CJbu0RnshTxlnOMYXTa7jw1Fngm/4O0rUhMHtQza55GhTtYDuEktExMTTCQ7mTTrorjW
	cC6FQs4Jcueb40p32AI2SoeXgQeVQKNw=
X-Gm-Gg: AfdE7cmzRLXuYFIk9+1NXEPscOdYH4Vg7ilC2V34Vh4TYh97cFNmP9KpsJRlB6e6LHA
	A1Lvil023Usc40I6ey0wLZSpctRPLRmIQhAFkMSO3RAzZL0QnuzNROcxmIzk9i4beMrxstUH6Cy
	OiL3oZqg6RjcvSlWHGS7y1eoGr2m0bvicyxbxRQpSIjdNTvpkSWz2D4UFRn9Nwq0kEPUXN6sHN/
	cslYUZ8X8zwc6QVFNz6M/5vjd1q0YuhqrTBvmOPgGMJVXUlQaJnSVSgxPLP9n30/IAWKtemZyf2
	yeP9LNVFn4pkv2uJu3lGLMhS/jCe2lw//IwilCwwN5cnHCdOaVU5vg==
X-Received: by 2002:a2e:a994:0:b0:394:3b62:b6aa with SMTP id
 38308e7fff4ca-39caa14ea59mr36819751fa.12.1784118322672; Wed, 15 Jul 2026
 05:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <178370682987.2572738.13491033810212556744.b4-ty@kernel.org> <jhl7fic36ec36pyaduw6xtmgvr75sxurngdykljbovdbt2j23g@ezon25dsv3hg>
In-Reply-To: <jhl7fic36ec36pyaduw6xtmgvr75sxurngdykljbovdbt2j23g@ezon25dsv3hg>
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Date: Wed, 15 Jul 2026 07:25:11 -0500
X-Gm-Features: AUfX_mxYH4-79PzEKbul0S_jMoxLx16udW5ZOUTVeJXUFPAxj9_qNMvYlkM_evo
Message-ID: <CADi83T4bioudCtHk03hLkOf7PG2up0gwoDTWGaseGh2m3R7ecA@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native
 ipq9574 support
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, krzk+dt@kernel.org, 
	mturquette@baylibre.com, linux-remoteproc@vger.kernel.org, 
	mathieu.poirier@linaro.org, robh@kernel.org, conor+dt@kernel.org, 
	konradybcio@kernel.org, sboyd@kernel.org, p.zabel@pengutronix.de, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Wed, Jul 15, 2026 at 2:58=E2=80=AFAM Marek Beh=C3=BAn <marek.behun@nic.c=
z> wrote:
>
> Bjorn, Alexandru,
>
> there is another, much newer series by Varadarajan adding ipq9574 to
> wcss PIL driver,
>
>   https://lore.kernel.org/linux-remoteproc/20260713-rproc-v13-0-41011cbcd=
a3e@oss.qualcomm.com/
>
> I suspect these two series are incompatible.

The compatibility of the two series was discussed [1] with the Qualcomm fol=
k,
with agreement that "it is good to have [native IPQ9574]". I don't see an
incompatibility with how Bjorn applied this subset.

[1] https://lkml.org/lkml/2026/1/14/300

Alex
