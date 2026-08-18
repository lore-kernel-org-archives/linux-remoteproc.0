Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E483A48C2
	for <linux-remoteproc@vger.kernel.org>; Tue, 18 Aug 2026 16:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787071768; cv=pass; b=r9vPfSpKeSafuKgwjMEvFOSFoRjV9PfcEvG858Y3wQhsNUbwT/iWJysLJcpDsQHhBOOJjEpFEjLAgmnLrKPZFpxjqRRL3oTBpCSzRjOS+Pu+uHAUhOU2oTn/C+GUmoQIA44uxZYA17dnJTGnB3Dm4gBZ0ZQH3EDLoa3LfGlteI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787071768; c=relaxed/simple;
	bh=/W7LqnrO+2wndA+6p7OOshIkNKKlsT+dW3mXLbZi7XQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MWYTlR23k9XwSoDc6nVFYq0+AO1WkzGS83TULPj+89NIEiWuyHW8rUNHxQtI/d30AL7jJUtV059EY3bVXH9/CwH+/PSlFl/cI2XqhiC7jLOTrAoescCZDhixmcpvWWzaSvlLzTl1rTNzfiDQ3+tij7J7yFSnDKxO44yaLBfGilg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JBOF2hgG; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JBOF2hgG"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso105765a12.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 18 Aug 2026 09:49:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787071766; cv=none;
        d=google.com; s=arc-20260327;
        b=o10VyGRS2i3GPTH2oi/Zl3sPUoN4p0qqzx6+9V+1t4qLrOgX/a4HW4bsq7L1RQdZE4
         jJyS8PW3Vg8CYXriZy4y4ipZUl7zOC5J9iSNFlLmWQ2gsxVvrGWygsChNfGzKwXVTbp5
         3P3qFsao/WFbzx2wap6awfilcZQ86W/oEP/4N5tK/AQlLu3pYP0MaRSj0MpPTuW/oOHQ
         n0OBzQbHthi7O2X240qPNvaXTeAXgOzzfqu2rqjJ5m4RKfChJNXPVWCpM4RwCGLTWepY
         fgCP3vKAGlMVf3bKXTuIPx+LzjClDpuRV9nN+s84fWX7YOKKCdq0xFguNNyyefUvF3EI
         z6QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VjN0BpoGIB/E1v9hede0VOs0r/lK9NwThruaSuNdP2k=;
        fh=Zx0/tR0mzNYf7/j7zqTF1tUssrwOporSxVlToJEqewY=;
        b=JiETscFWJAKA8baz4sNyRx/iwgMdf/E8igpavn3xXLqYjiiEZ3zRKtOonZOAcQazma
         oQ6rAIMTNj8o9nmHFSgkqmT58B7g6shaV4s8zpJlrYUSOEAEsjmMgmXC6D0Gqre9PV5C
         Jk+P8dcO/3O6v2sk06L9ydO8e5MMpoZ7TFJ3C0a4NMLjPl9Z0bb1i2NxPeGAO5RFTR+Y
         ArTawwqQA2osBHpR/gtGcKlqMj5dHRS+JJpshhumHlmUwI3cDLh3PZhS1rZEiHY54fHS
         irFPyFnclI3aQnVUTFdm98trNouXonstUgHGFOWlsr5Vq90ifLOUDa8Hc1/3XPNqrbce
         u+lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787071766; x=1787676566; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VjN0BpoGIB/E1v9hede0VOs0r/lK9NwThruaSuNdP2k=;
        b=JBOF2hgGpJ1IK7MLfM56zIQyQEzi2ptoriAdkfzgEH3aExR5T0ys/Y8Ec1lx0CVSya
         kJKTSRjH5MQcmaJkQc56ANz2jrh9Sv+ypOzsBcWIUdzgO6fKQkjlNQHmpCs310QQ6F7y
         vDOzX/lFGV6jG6qQjYYiHR3ePqtGUbANPiDqc0313R3zESLdAV7z/E345JpopaG8bLUy
         EXfjSe6zt/SFQjb0pmcO4gE0ARyAuH+z9XDhbhcKhlkVVG7bXfOv0Gjjoero7QDR9ThS
         jG0aAiyb7+Gwqc3LfsP8LIJhBALJvBLSJnPZscezQmqapWdzXRoHzzjqV3wz2A+pp5fw
         NZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787071766; x=1787676566;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VjN0BpoGIB/E1v9hede0VOs0r/lK9NwThruaSuNdP2k=;
        b=JBgpxTt/YNqb6vDOsnolzH8UdW6hEa56eugIkwJJCZ57yjT6RodJOy3DwPRuqUw7Va
         0SBoIc1If29HyvuJVuCy1bUV6yyo7Bo9AwaD1EBcsiyimWM3Ynw98Uqx2f0nHFaU5Hee
         QIw022jWQMt3+9F4dOLN+hI09aYxCG/qR0w0+CZTZ/UtZDMs18+5vBPKTjx5pZobssZa
         A50Uv3lFwjEHTZQScUGp2p3LZWKPQgVRx2yvT8gK49re0f0PtDGnX1PG/5MjUdzV+OeG
         Q+q58sgJIx42Xn7XBowwtYkAxeVQ1JE8I9/jLVcsuddtRuvmVmuazufwYXsDNBzf3txb
         rPrA==
X-Forwarded-Encrypted: i=1; AHgh+RpOCPwzVNRRqURLUe6Bu+tX9t3fxBtHid6uHCLasrfJwD/l6jSG3Xp5hiRVaxyUa1Ba0G0FrBplg3S/tDnvjEVe@vger.kernel.org
X-Gm-Message-State: AOJu0Yy23vOWw0/wvybK2WcREqNZh0eQblLbz+JI2P8h82sLrSCynRXd
	JD2H5+OOfJ1mGZLF8vnHawtYzAzMcqqsiSKmdSUs0KwKpLjBpB+sAGN7ZvtpC5Xu8Q4DxqD1+p5
	pYmmLj5Clnq0avwCs7Mo3VBQCL/0J6V/vG+odkvipIQ==
X-Gm-Gg: AR+sD12qQ5Y/M+xfiEvTwCUPI6LviIceJAP8uFbfj2/MTJB2U1D5I3+Qis7bNDBpvex
	FxDjzyKmW/heLhHNVsLl1HS1jXByBy2T1fqhSpmO5bTZEEzkvhIZzeeG3El9bezoEr5acyY4dqD
	UvcaSBRX8uWgMgufZDcITZ75I9cfVsyQFqxQY8BMD9+1yGn2BmuHIIj+acDE9D2hkuc+V1z6k0d
	URdsVjUf90mJeqkoX3dcn56bbV+TWCUIiwGkhpe6bPCxZfMjrQHzZxpSepAJDyqe0eLIL3J2A/2
	lcS+MOw2qvLGMH3LJHKKrg+RvAZwTgBk3PaXe8d5AgLrPbJ+xlhPYE8xUqod75PKfLOaigNtxlF
	Rh/8=
X-Received: by 2002:a05:6402:4516:b0:6a0:9cb5:4f33 with SMTP id
 4fb4d7f45d1cf-6a38a96b746mr18047451a12.13.1787071765543; Tue, 18 Aug 2026
 09:49:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727062851.2934443-1-b-padhi@ti.com>
In-Reply-To: <20260727062851.2934443-1-b-padhi@ti.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 18 Aug 2026 10:49:13 -0600
X-Gm-Features: AcwNN1WVEX6AINkC_lCIagbgwONWmz4FsZiyMLSYR7w-pOYABSF0E8EmOZnEboY
Message-ID: <CANLsYkzbySU1NRb=LFKZfY_q6WyW1ZHJU3K09DUWHFHuAMqb9g@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add 48-bit DMA mask for TI K3 remoteproc devices
To: Beleswar Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, afd@ti.com, hnagalla@ti.com, u-kumar1@ti.com, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Jul 2026 at 00:29, Beleswar Padhi <b-padhi@ti.com> wrote:
>
> The TI K3 R5F and C6x cores can address 48-bit memory space through the
> Region Address Translator (RAT) unit. Whereas the TI K3 C7x has a native
> 48-bit address bus. RAT is usually programmed from the firmware itself.
> Configure the remoteproc device DMA mask to 48 bits to enable full
> addressing capability for DMA operations.
>
> Testing done:
> 1. Verified above devices are able to access 48-bit addresses with
>    compatible firmware.
> 2. Verified IPC with Cortex-R5F and C7x DSPs on TI J784S4 EVM.
> 3. Verified none of the patch generate any new warning/errors.
>
> Thanks,
> Beleswar
>
> Rahul T R (2):
>   remoteproc: k3-r5: Set a 48-bit DMA mask for remoteproc device
>   remoteproc: k3-dsp: Set a 48-bit DMA mask for remoteproc device
>
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 4 ++++
>  drivers/remoteproc/ti_k3_r5_remoteproc.c  | 4 ++++
>  2 files changed, 8 insertions(+)
>

I'll apply this when rc1 comes out.

Thanks,
Mathieu

> --
> 2.34.1
>
