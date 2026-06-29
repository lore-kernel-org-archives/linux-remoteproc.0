Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3A33B4E83
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jun 2026 15:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782747367; cv=none; b=A92MQ+9AxC08d4YOeKpIRtOtHLuhrYgy/tLKoTzAI74d9JKHbAZ5kKVIwlrHyKC+n71kcVyqK7qsBh0nINeZZ/pwsURg3HTn4BUWSv6UP2WjkQTp4hGzOesXzd8QKTuh472rZ6iagd4eJB3qsYeuJdHvE30WAb4mAYwzH/8toT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782747367; c=relaxed/simple;
	bh=dPo8To4lMTniabQIFcwXhKUudpCTlGapUPHUrc4t7vE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U63NW1BLNQ0zjDvvYUwyy8a8PpoDCPvgEaEOKwvAViqSgxE3XpiqbfT6eJa+FqwPIgBSKtSO2GQmjzhkGauLw+lVBmZYTvSP/xUzXyPQNxQQbSep6b0Cd1GJhvfauSNmGGJka2QUcC2H64lSToUmTl+uHMYYIiPVkcpBYjK/+2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ivuyIXk1; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ivuyIXk1"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c9d87b1f9eso9481705ad.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jun 2026 08:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782747365; x=1783352165; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RsiAkF5rnsXrEzna1iMYWZla+7JEf5EC3Z4oGTp3rT8=;
        b=ivuyIXk1NnQNuMeWlJvjZkrpeKXoBAcIKz4Uj1WpGnzkY0BVFnf6Tcp6bDOgYiGKxl
         MiJYT6jhdY1KyRsVi1PuUAfmQj4Y9NpaQZ5WpUjRilfPUJ/D1oO8SAg/zoxLw7AqhH08
         g6ien+v33DrmsfxNIh6Aqcrd2ip35GTcb55tHxVHuFFUj6eYkg8NjHrkaePsPVQNVGXa
         PwGmaBStyxZqFKFJo8aMYYH5P2+64XoL6YOvDGbpojTPAdFvyG+7EwcWFWE2BnSf8O9c
         R2IuNBUwgOFcJ0wE/5EmkEOPMCIoP/ii6H/X8trWv0KZDXkUQmPvQU08KGMk764jMxYO
         TghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782747365; x=1783352165;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RsiAkF5rnsXrEzna1iMYWZla+7JEf5EC3Z4oGTp3rT8=;
        b=Jc5piXGhyFWQdRrvcUhY/MLfNl+lUatLdLV3G7kjaerxlbQ0aP55KrztLaC5b3DHwg
         M+ftZ+X6yXfre5BS3Pph0VSIynpEQe8ck3J1tqZKk7m1Y0Cv9qzpvjGrDjSIVRN4VGDR
         /2JEJfHxaL4adi3641oJ9TEM0OozggBRWsf4fLSr9Ptck83R8N2fWn6uV/KbVUJSg6W5
         7W28ufbnj94HHbSiTCa2VFsqLe/VGXBZnixnpUj+MIjqR3w+Jb5vnE/mSEIvpBQf1Z3N
         1OmS9z9ZcVLDjwopVw8fNTlP3Yux3W1Kc8uUFfyfAiJ7lEPniVEFIKVpPQIPVn/NmXd3
         Z0Sg==
X-Forwarded-Encrypted: i=1; AHgh+RoFuKGXRSDG95Er9sJicgsm0MUxqH2NI9AFKaD49CwloBH/LIriz/gOVgow9dMJj9S/O221nbf6jrI0NVKsrimL@vger.kernel.org
X-Gm-Message-State: AOJu0YyDV6lfRVjSeFgX6bX/a9nlKpE71q9GadYoZ4QqMrIMSIoDYT7n
	ropzZ9gFHot0t3YJ82r2R1eXhJmN+/Kr6XByoEAUgZQWbZInDWqRwHLinnfZPyjewjA=
X-Gm-Gg: AfdE7ck+NGYM7FPoVt4bwtbjpp4v8lnWOCkVMhAXntAju004Jcn3EVS5giGbfik/Bn2
	IPLO/eNmyTlWFhMtZk/GW2VAhFbDzW07lU+yrBxsp1tCqJn7FFKYpnRtuBHwuZ1UZrf9dVJi+qd
	JUwB+okqQPLbRDw+2DY7585af4aE7H8xbhCEVZOSdkqvBJDxsEQhtNHoQTGnXxi0IJYdDSnLPrp
	04KMABZocJ48IQsPokPcomRNnRDHlM4T8CqmAro4O9A9sxmfiM4Mqh+A/HZj2cgawRksyUwsGL9
	P0jZncByzB3SaWq6Is17DPV1qrabfRxfehX1gWLda4+XICmalEV8J1ivGfMEeDqKIlrTm2rtA7r
	slItzJJFMCgvavsRAJ4E8RTMPwI6GTy2bCrbgZBABBd1murqPvCqw/o2Pj+gvn3iJTEb93reUQg
	8ePFKdmLrdf7z1wsGUKyzWLKsl0ho=
X-Received: by 2002:a17:903:2f8a:b0:2c0:b5c1:8e22 with SMTP id d9443c01a7336-2c9854b5597mr89458355ad.12.1782747364963;
        Mon, 29 Jun 2026 08:36:04 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:aa83:261a:68a7:9974])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d09f0sm98408955ad.56.2026.06.29.08.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:36:04 -0700 (PDT)
Date: Mon, 29 Jun 2026 09:36:00 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Tanmay Shah <tanmay.shah@amd.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 0/5] remoteproc: cleanup shared carveout and
 resource-table helpers
Message-ID: <akKQ4H09G2MpRVGN@p14s>
References: <20260529021637.2077602-1-ben.levinsky@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529021637.2077602-1-ben.levinsky@amd.com>

Applied.

Thanks,
Mathieu

On Thu, May 28, 2026 at 07:16:32PM -0700, Ben Levinsky wrote:
> This series is a preparatory remoteproc cleanup split out from review of
> the AMD BRAM-based remoteproc series.
> 
> During review, there was a request to move the duplicated plain
> ioremap_wc()/iounmap() carveout callbacks into common code and to
> factor the "missing resource table is OK" ELF parsing path into a
> common helper as well. There was also a request to send that cleanup as
> its own patchset first, with the AMD BRAM series respun afterwards on
> top once this cleanup is merged.
> 
> This version keeps the same overall cleanup goals as v2, but reworks
> the optional resource-table pieces based on follow-up review:
> 
>   - reshape the optional resource-table helper in patch 4 into the thin
>     parse_fw() wrapper form suggested on the thread
>   - switch the patch 5 clients over to that helper shape directly,
>     without post-helper rproc->table_ptr checks
>   - keep the driver-local parse_fw() wrappers and their existing log
>     messages and severity choices
>   - retain as much of the existing per-driver parse_fw() logic and code
>     placement as possible while moving the missing-table handling
>     through the shared helper
> 
> This series now does that in five patches:
> 
>   1. add common subsystem-private callbacks for the exact-match
>      wc-ioremap carveout case
>   2. switch the in-tree exact-match users over to those callbacks
>   3. mark carveouts mapped through the shared wc-ioremap helper as
>      iomem so the framework uses the proper I/O accessors
>   4. add a common helper for drivers that treat a missing ELF resource
>      table as optional while keeping per-driver logging decisions local
>   5. switch the matching in-tree drivers over to that helper while
>      keeping thin local parse_fw() wrappers
> 
> For the carveout map/unmap cleanup, this series covers the exact-match
> users called out in review: xlnx_r5_remoteproc, rcar_rproc,
> st_remoteproc, stm32_rproc, imx_rproc, and imx_dsp_rproc. The zynqmp R5
> TCM mapping path is left alone because it also clears the mapped memory
> and is not an exact match.
> 
> For the optional resource-table handling, this series converts
> xlnx_r5_remoteproc, rcar_rproc, stm32_rproc, imx_rproc, and
> imx_dsp_rproc. st_remoteproc is intentionally left unchanged because its
> parse_fw() callback also builds carveouts and is therefore not a direct
> match for the helper introduced here.
> 
> Changes in v3:
>   - rework patch 4 so the optional resource-table helper matches the
>     thin-wrapper form suggested in review
>   - note that patch 4 still triggers a checkpatch --strict warning for
>     the flow-control macro form, but that implementation follows the
>     maintainer's review suggestion for the thin parse_fw() wrapper shape
>   - update patch 5 to use that helper shape directly in the client
>     parse_fw() callbacks
>   - drop the post-helper rproc->table_ptr checks from the converted
>     drivers
>   - keep the converted parse_fw() wrappers otherwise close to their
>     existing structure and placement
>   - test xlnx_r5_remoteproc on the latest tree with firmware images
>     both with and without an ELF resource table
> 
> Changes in v2:
>   - split the mem->is_iomem change out into a separate patch
>   - add a common error message on ioremap_wc() failure
>   - drop logging from the optional resource-table helper
>   - keep driver-local parse_fw() wrappers to preserve per-platform
>     missing-resource-table logging policy
> 
> Ben Levinsky (5):
>   remoteproc: add common wc-ioremap carveout callbacks
>   remoteproc: switch exact-match drivers to wc-ioremap callbacks
>   remoteproc: mark wc-ioremap carveouts as iomem
>   remoteproc: add helper for optional ELF resource tables
>   remoteproc: switch drivers to optional resource-table helper
> 
>  drivers/remoteproc/imx_dsp_rproc.c       | 41 +++-----------
>  drivers/remoteproc/imx_rproc.c           | 40 ++------------
>  drivers/remoteproc/rcar_rproc.c          | 41 ++------------
>  drivers/remoteproc/remoteproc_internal.h | 38 +++++++++++++
>  drivers/remoteproc/st_remoteproc.c       | 31 +----------
>  drivers/remoteproc/stm32_rproc.c         | 39 ++-----------
>  drivers/remoteproc/xlnx_r5_remoteproc.c  | 70 +++++-------------------
>  7 files changed, 73 insertions(+), 227 deletions(-)
> 
> -- 
> 2.34.1
