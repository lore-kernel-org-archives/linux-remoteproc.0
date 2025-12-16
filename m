Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183A3352938
	for <linux-remoteproc@vger.kernel.org>; Tue, 16 Dec 2025 11:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765885766; cv=none; b=SH+PK9JqbwCHczleS/GzyKlISyHKGLYijzaC9Euw3yn1pZWEQz3CaNAyVaEGwc6iVzODyRlYtDJWDlKgOZcfjvDF9Sc5oi9ahO6z+HXJH7e9utyWhNeSLZ80wjke7UhLcsXJVRO3Df8vt6vbNZrjd6pdfwsb5zur8HYBL3CFYFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765885766; c=relaxed/simple;
	bh=P3r5nPJCwq57O4gAEF8RXUKtm9lIBx2Lzztq/sylt38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fn16MPWxwMvQ4bFZct3bZDpYM3vCci25UgdchmJAQsyDesy+/gbd1yWRB68+t4hbhSASxfRkyBvT7Pb4jHw/81NuJbp6a3oTH0UeKRLbUIWpQngBe/e7DNab3SJuMPGjYOAo39c2DvvM9AD4DMILsAnq/aiXzG0pcIr/AP9rozs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dgtd9fOE; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dgtd9fOE"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-bf5ac50827dso2835979a12.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 Dec 2025 03:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765885764; x=1766490564; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHWMHf/Niwek5OLfXdmD1/NkgvAHjqsNRHIl2ImUeLk=;
        b=Dgtd9fOEnyuvvfu34Ax/bMvZOkxkmM/850v4lVMVLGEhF2ITsgg89/3KEnwNNQMgcA
         EOFjYYeNoaOpkrbCgsx5oi+ytLKkF9ysQaRBTOL2EnPR6uYHL8UbpHAHK0PzILyAUzSz
         5XtAvkF01aI1hYIHyPB5H3amu16hyDJAHvv3LRIYjxnT53TLNeXtHmzi4WRrmIi/Pto1
         X8+Ih2YJxm8wrKLRkgorT+ODeOnmXjePxtDNDamBA5oYCLzPo9WFYd1TG/yBPRgdVxN/
         LDW8RJ45MoyLV8oT9mxFoF/hec5FagdZdI8TBY/CSHzK07tvKphF2lR1QgLYgbZCR2Sh
         TRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765885764; x=1766490564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AHWMHf/Niwek5OLfXdmD1/NkgvAHjqsNRHIl2ImUeLk=;
        b=Ylh1mX4OFmH95gdy7SUFfv2+hG3hbGmFq5P7rFXrj1I75nj5YHV2BP/SOVEv+269sG
         9tjeXaDQq+GnyKq/1tlkNIvx36j5Bnsce6c4s7xKQAfTVoDpPNLqS+fJjNJHThh0+T4c
         4EE2LBg+JlXJR/Ws/x6GR/o7yd3J0ZURAx22Z8Zqtjxp/ygHuF3P3Wl5fkBzG+kZfOv0
         oUhxMAt/MebAcW4vgSWQeqiLWD/KJJr/R8VZu4GTm7wM0kuOMcfD8arzs0EoYNAyzCa9
         ATaNWg1p2s4t++6HC1z/LvOEAJ8xzB/OrZaJyq37k2hJFcZU2NiW9H31pCM10iNAG8kr
         FDZA==
X-Forwarded-Encrypted: i=1; AJvYcCXzpIR2gfIQbnggdwwwLNA8siCL/PMLkn62cZ52B8K4BSIfrg/QEQOUvDzJkoBwod33QxJJ/HB0P0RwNpY/Sznh@vger.kernel.org
X-Gm-Message-State: AOJu0YxAk6qrFboUCng/zm44vLgOcUuCBsOmrOf/U5cN1Q10t0a/alFt
	/vUSuYDmOBgTLxf7XcW2njGm4z8DH1lulBBM5p1ojNG6mrd/Hng+3dMn/GByy/PNqTDVp5GJXDb
	EyBhsrDQ8i9qEU7GCmcMm1tjaZCRonXzttQ==
X-Gm-Gg: AY/fxX6/d8hPb7xE/iB5AbRc7d6ZzQ7v84O0uIERC/434p7nYmeT4fvorQke8xw/Yjc
	XNBAbq9JSSryeujW9pdfr5XIySVP6oAtXf+/EiNt/LEa83foXzv9f/qMMwdr9uRi/UlYtfi3X6v
	s9RGU8mMN+udMXuWmhDnJFRh7hLiRwoN+cl8YzDt9DyPa9SATTYp7GbrUMIR7zXsg1P+NsRmDPK
	g95FdsfTEry6YB8EVrh5RkO/gFKPMtXSgYzdIpSPbfc89nCGI5cGXk30U1AhdGSRg7ZfVcZfHkm
	BOdU0FZ9x+9LsUBkQXQ0hWCIxV3iPfhKXePcHuszL5My1jpHlTpQDD38MnXZdKT2ip2TZwqLr3v
	avjYhst3GBQ==
X-Google-Smtp-Source: AGHT+IHPEep5dtYauknDb8YyMm1kDWolPZTnV2HvftVKII1DWWjGIN4YN/9xsVgqVLYIfLemujNO/0Bup29BPcFhFqI=
X-Received: by 2002:a05:701b:2415:b0:119:e56b:98a4 with SMTP id
 a92af1059eb24-11f349c583amr8528888c88.11.1765885764035; Tue, 16 Dec 2025
 03:49:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216-imx95-rproc-2025-12-15-v4-0-bf1064ea8daf@nxp.com> <20251216-imx95-rproc-2025-12-15-v4-4-bf1064ea8daf@nxp.com>
In-Reply-To: <20251216-imx95-rproc-2025-12-15-v4-4-bf1064ea8daf@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 16 Dec 2025 13:51:55 +0200
X-Gm-Features: AQt7F2r5R94-pfKGDYvFfrkyngEDJyIru0ByBqDzhFtMH5nZZaARnweMqygnu0M
Message-ID: <CAEnQRZBS7zzc9AmTymCGVKwExeZ-JNFiG9MamWOZmk=gXdBY7w@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] remoteproc: imx_rproc: Add support for System
 Manager API
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 3:53=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> one Cortex-M7 core. The System Control Management Interface(SCMI)
> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> Manager(SM) includes vendor extension protocols, Logical Machine
> Management(LMM) protocol and CPU protocol and etc.
>
> Depending on SM configuration, M7 can be used as follows:
>  (1) M7 in a separate Logical Machine (LM) from A55 cores, that Linux
>      can't control
>  (2) M7 in a separate LM from A55 cores that Linux can control using LMM
>      protocol.
>  (3) M7 runs in same Logical Machine as A55 cores, so Linux can control i=
t
>      using CPU protocol
>
> So extend the driver to using LMM and CPU protocol to manage the M7 core.
>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
>    is fixed as 1 in SM firmware if M7 is in a separate LM),
>    if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
>    protocol to start/stop. Otherwise, use LMM protocol to start/stop.
>    Whether using CPU or LMM protocol to start/stop, the M7 status
>    detection could use CPU protocol to detect started or not. So
>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
>    status of M7.
>  - For above case (1) and (2), Use SCMI_IMX_LMM_POWER_ON to detect whethe=
r
>    the M7 LM is under control of A55 LM.
>  - For above case , after using SCMI_IMX_LMM_POWER_ON to check
>    permission, SCMI_IMX_LMM_SHUTDOWN API should be called to shutdown
>    the M7 LM to save power only when M7 LM is going to be started by
>    remoteproc framework. Otherwise bypass SCMI_IMX_LMM_SHUTDOWN API if
>    M7 LM is started before booting Linux.
>
> Current setup relies on pre-Linux software(U-Boot) to do M7 TCM ECC
> initialization. In future, we could add the support in Linux to decouple
> U-Boot and Linux.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
