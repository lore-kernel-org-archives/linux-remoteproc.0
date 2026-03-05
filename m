Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0232D9ECD
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Mar 2026 19:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772739198; cv=pass; b=OOcBXFi06rJjidCO/0RhLCu99RbCp4xRC7Y5YHFy5rN1yNGj46vSU/4r/49X1zknNiP5qggdxQD2dLkCViY9wBH9fNiRdEI85IiMhhKnI41fj1PiD2QGlPIyPVD0NVtJBEHcFFQ1DwsD5mFqL5H+hKvAfRlVsczNKl2ZETHJnmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772739198; c=relaxed/simple;
	bh=3qFS8mp0A4He5fJiw82IIXCHjDSfPLpUJggQOZM0oiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m7C90C1a3KVb8jtnD72x7Qz9mBjxSs3Otr3DoTlJjPyUl6JEyIMjaYvWqYv8vn6gIHQauEbyVrEwMxjFS8yF69/cDr0YI5/HhJjhTSPY6me1K07yQWC6NiMvo5zdduB1Wr/aWlC0FRPW2STvlSH8yiGV0p19IxLVckNB5V97Q3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVeZOfAC; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVeZOfAC"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439c9eb5d36so2053515f8f.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Mar 2026 11:33:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772739196; cv=none;
        d=google.com; s=arc-20240605;
        b=RbWz84YLqwUpy+1zNTOZ4MD+2aNOi6aWQSs7OcFIfgt4HTrpL6xIGEehlqnHEQ0p5s
         2scxz7O/5wMjHaQEI+MSCJ5ws4QuCEzew1fNw3zblNw1Slp8MWp7ArHTZ0XT99Q2CQr9
         hNKsBcs1CWDrA63p5lmpX/7grsSeyi/i5gvO8rxGqZePtnTtnNkMXk2mqels6Na5rbjG
         ZvdYIu9SRxrnAzOIRcZ+Ig9HjbucHm0pWwz++rMLdgsZapo6t0Bfb/B7HkJGh2Ydklnp
         qwXenTH4voYR6o0x8DdfqJkgL2gXCSVg1h6eci3uK89q4jJ/FJfnGQmzDRP59hQdaAhk
         sfIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3qFS8mp0A4He5fJiw82IIXCHjDSfPLpUJggQOZM0oiw=;
        fh=YBKYiCEBsIK/5E2GOjLSAhuIYG+B3x2PQDqSC3SmX7M=;
        b=NWJKpS/rZjtcIjEPGMfnGtMnXC8Mf0tdmJJgJOQl83tYvcfiuhc8HHI334I7i/Gr6t
         xw/q8OgFonRqC+8b+ptaJS4aUEeinhYQvsgTDu89BPrpvBRst+MBXcnGlrBi+/aEFxxh
         tGsDbf5tcR2mIDDSyTSzpJcKzaZyDTBITlMDHbTeIFpoQsyYhgB8DvXB3tNDiZ1osIZb
         VJZnDQoYf6qCov5WwjH11v+tNNJyBBABwv737at68dmxe+E1ZEA8e+2dAg6AjsXYfQMO
         wykX4bJM0Ky9oZ4MoeJdC/TNp1qRq/MM0+0zTtaJA7R3rseW4+F3tfgIZ8wSaI/71YPU
         //EQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772739196; x=1773343996; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qFS8mp0A4He5fJiw82IIXCHjDSfPLpUJggQOZM0oiw=;
        b=jVeZOfACPg/8VWD7c0bO3LaI/kL5nUbhPlYeOSdEfTHOF27afXdxGnlRqQy3x4KBPZ
         1Nm9UbzSUO7kjZpPI4DFnNmXW3D798vg8pR2z30ej+P2w4rHKXeC4KN/W78+LDbXnWGC
         xnaSmN46c+6c8yEgX6D6QvtkgUhsJ1G/lI0NtyvM3EeP3ZcNGG8++qjDkaHcZrSt2jhw
         Wxk6Ek6Aqxf4dI/5g/nqXwrQqFHpZg8RpvKRk2ez9wSuwas3rXG+s88ez0wDouD3EpB3
         1jU7fxTH5Xg2gsdAoiBXb7qEV4O4qG410kjIqh6/vlTR5Nb9mARFH74fptWt5EYCDrPj
         RlOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772739196; x=1773343996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3qFS8mp0A4He5fJiw82IIXCHjDSfPLpUJggQOZM0oiw=;
        b=HhEVV85WPhRtcrKPESbo2jHm9ud2MKVeWpMzv+eAT1uPUaC63irNE/MXQmG7atfcve
         FNi3lW2XYQXvd6TkTL4M+kCeDDNYeFluSUAPfm9eLK84Qq26JZXaQlXbVwxvKJHGbqKK
         RQI9zHx8kvWKZbEqms9UYLkjDUzlE/5dsKsOyFMASD7lxg6MdRtGsfuEYzmBrrsfmeJe
         dO9Tr7zFJqZn0HCOpnimCIEDZlhY6H08E5Xx+PdVbxykGKrzcObYZeGIp4TXhsUfoZuP
         gJTqiVIJo2xGHwcrn/NA6c5XvHxHXP17X1cYPBApnkiWVdfKdrLJHJUZZSEdlXsW8X4C
         TIEA==
X-Forwarded-Encrypted: i=1; AJvYcCUyYVCwwdSX199OHmtdMEChF/WjCmgHcY3wIJ26EwvYaQYaBIuMMVycubW3xl6laCW+MI4P14cOVEDpNc6H7h/Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yw20Ud7O8f1J4B4DekT51itVVU3cvmvxH+Mul/h3kHsukHF7CGB
	O+3nQtrNES72fYLVfTwCq8oEqo20TknWYuctt5ae/iZ7NoESJ3TBUMezDF0Izjb+mCU54KCk9z8
	Nlhf/fNR5zk05Vki5xF2YqgI2mOyvCdE=
X-Gm-Gg: ATEYQzxdLpCIAHSfQc/otxXydpnslxnLxKq/pTMnRT9ovkReO0X4WtvVtgyUwct6eo/
	pJwjBfW4sdDri6iQdtjVku9q3VoVm5z4hWxyDwZMuX5M/E12d6FSlM6/+vgRECTIdIMA0NPHbF5
	otdTNTkbsa4gLuC1u8NtQhXyRADSRqLaBidSJr5mgQW72k89hTVVzOjFA4AFJwEAQdnZlKCIhL3
	WlfBhliNSZEiD3fuNZg201ZcwZUw5/f2o5oET2ROz3Zn6KaoZwtPyKQS2QOdvAj/DHZjFuVv8Pi
	M4IbK5ox4QbwmrEd8lFTvoGFITbAGyJ0goSvqqccfXMi3aFvu9UgQAtG98vkKHhOwHf2ey0J0B3
	RyqisLu9BuuRMrjzWqmAX2G4=
X-Received: by 2002:a05:6000:2891:b0:439:be2e:7339 with SMTP id
 ffacd0b85a97d-439c7f62551mr14098972f8f.8.1772739195787; Thu, 05 Mar 2026
 11:33:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305003253.1022386-1-kerigancreighton@gmail.com>
 <20260305003253.1022386-4-kerigancreighton@gmail.com> <dea45e4e-aebc-46e4-a245-3603da1779f3@oss.qualcomm.com>
 <CAN6+ztxfcNR8xR1qwgHQcHHM=zoQbMd-8oggb785ssPZ7f=y4w@mail.gmail.com> <CAFEp6-3JVicAVJB_+5ceSar2Jqstexo-0tyemg3C=qcznQsmxA@mail.gmail.com>
In-Reply-To: <CAFEp6-3JVicAVJB_+5ceSar2Jqstexo-0tyemg3C=qcznQsmxA@mail.gmail.com>
From: Kerigan Creighton <kerigancreighton@gmail.com>
Date: Thu, 5 Mar 2026 13:33:04 -0600
X-Gm-Features: AaiRm53h5gsIaUcJ-3bFQKEClfESn_bqkCltTUpNu0-wZ5K6CdZUoJq1mcxWf_M
Message-ID: <CAN6+ztxepeRaYPoTBj5rkeHZFhpZbNu4UYZ1Ajo-0cwsG4++Yg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] wifi: wcn36xx: add support for WCN3610
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-wireless@vger.kernel.org, 
	wcn36xx@lists.infradead.org, andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 1:16=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> Could you please add these details to the commit message?
>
> Regards,
> Loic

Yes, I will send a v3 with more detailed commit messages for all patches.
I was asked to wait 24 hours between sending patch set revisions.
Apologies for my poor etiquette (sending HTML email).

Thanks,
- Kerigan
