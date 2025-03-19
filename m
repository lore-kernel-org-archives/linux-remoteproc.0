Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE0A2528F1;
	Wed, 19 Mar 2025 09:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742375512; cv=none; b=F2SewwtshJdIuYcEwVd9xnh65ZHekohesfaDuPjCEYjVS4h4laCj3VnIo91H0QFuEZXybeVyGLLJJo92oA6cpHEkipum4QNz6ZgMhp48pDT8rrsxz6B0aGMoWBnQpzZ8ZLyPeOOwHFTNAXfpbQ4/H/18V0oT9COSgQlF+WD5ORs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742375512; c=relaxed/simple;
	bh=RuprYZJqwe4KDAJjtW9yEAvrmNFaNz9njuDT/tdH7A4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=acxW38FNFIB5NzUnrumE00wbxRVKqEcnZtXuuJIdBJSESAfbmcAORr2P1HTESRgy8leK7zfmf7u1MYPz71ls/1V+dbQXJ3A/a7D2ApQJ61FcpPd8WtLvVcAJMyWhK0JEWf6MrZwObFLb6qkILHFcMIEEuJ5aOG0vz9Yx7tCjnlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPWI+DsJ; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPWI+DsJ"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so941905a91.1;
        Wed, 19 Mar 2025 02:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742375510; x=1742980310; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuprYZJqwe4KDAJjtW9yEAvrmNFaNz9njuDT/tdH7A4=;
        b=aPWI+DsJUGZllbcDj2PMbHaim1LstxO5fTh5mW5WU1r8B9Gjt2p71u0YigezGxn4Yo
         IeQ4hqmdwOHNAegtlYRyWbRExKyGANQBInUcTI8ZzWT2/W3X0L/a6QpQNSrz0H6IzgCZ
         SpmK5zfl6fauWx2Ha8mf1tuq0+l0bS9970CBQVIb0ki6y49BRZlZVDl8p09Z4Cw3Zo96
         FIbPZpmflbS/qMsMDMnV5VgExlRuMcsaYXWS+z5yhQ+VDkN4jCySBug6fJbSj8m+WaRz
         1kKKaF1fsCXInYX90vPniRES7UuIbPuVzcXwhgnRH2Qc4z9hbEW6rgQBGzGoUJlkWQgU
         F3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742375510; x=1742980310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuprYZJqwe4KDAJjtW9yEAvrmNFaNz9njuDT/tdH7A4=;
        b=YLZH+dx3kaU2ji8EZ1uw7OE2odAPqofPHflSYyIKPKgC5TkZxPO+veNbJpbHhttcn/
         hq0u0FPE4j+1Elv12whCl2bAO6jR7suna6mQb5uJssZSx3jN8+BksAJ1f1KSrCcs3jV/
         ZeYcqoRkuH5QLEFT+k+z89s1CwAf4wb3nWIsga/FlO6RG/F1JRSVd5ATy5u0fEU2y9uO
         CiQ7Ukg4QHOqEyuerkGdAa3JyTbFFLx9R7iBUBD7S7+Xy5AgHMljZSIEqCLzDdCV//c+
         E+tLbK9WqKfB+cDo5em6OQso8OGS31Pq2tKPFlXvMggcUDOXc+FYfUTABuxiYqilgJ+5
         t5ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVH9PH0q2JTLfoGKh8PT3O92ZcPPIsyBDIaifjXsrtNJLNYh3AUyW3GFhNWmmDaUkTsMBUnfcIL7Sto7hqv6p1iww==@vger.kernel.org, AJvYcCXUmEPfB+eonHEGIFDmvm1SqBoMFb4ekO16oak5oS3DWgS2gimqUBScwu1AzDJOXRkDDb1VHK2/rxv2udI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLDZeVeqxL8s+9KnkaTcHENUnoehew+l8B7Oz2x9Ki6Sp5Gfe0
	kea40p9lX+L8stIldF4fkvd99koqe+nWnue/4dtQEHKBuXRyebviwibquCof5xs8eTS1cx8MqPy
	HL9KSI01YBCIWzbhaPlEaksJz4gCBLdJFYLE95w==
X-Gm-Gg: ASbGncvzcpluX9ieafwRVLBhjtHytwb35UaJ6Z9j8SVk8ifecVHA9na9kdSRKCapCWL
	dS+CkMOFor7J6lK+5EBrJ/IewG7CD9fCHEtDaja737WPX9LHa/evE4na0Ep81YHXphYrNpB7xli
	zfoIYNQEXavJl2eSbRfUCiOt8=
X-Google-Smtp-Source: AGHT+IHulUmmhxYKpHLvuuCvhzTKveyDkVYVm3d6bzpsr+IdlsI0aty1tIfogVOy7fjTdFZHgdUItr+f8aeMDLV0DvU=
X-Received: by 2002:a17:90b:3c47:b0:2ff:4a8d:74f9 with SMTP id
 98e67ed59e1d1-301bda60f37mr3574753a91.10.1742375510218; Wed, 19 Mar 2025
 02:11:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318215007.2109726-1-iuliana.prodan@oss.nxp.com>
In-Reply-To: <20250318215007.2109726-1-iuliana.prodan@oss.nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 19 Mar 2025 11:13:22 +0200
X-Gm-Features: AQ5f1JpoNZOhJi82lOgsg8paXpVn0pIptqVf5Y-45uL-Vvcne60Oe-MB2X2Chkk
Message-ID: <CAEnQRZCk042G01vfypi6SY3mR53kchHLYpHs_cg=sZ9vVyZFdQ@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: imx_dsp_rproc: Add support for
 DSP-specific features
To: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	"S.J. Wang" <shengjiu.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Mpuaudiosw <Mpuaudiosw@nxp.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, imx@lists.linux.dev, 
	linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 11:50=E2=80=AFPM Iuliana Prodan (OSS)
<iuliana.prodan@oss.nxp.com> wrote:
>
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
>
> Some DSP firmware requires a FW_READY signal before proceeding, while
> others do not.
> Therefore, add support to handle i.MX DSP-specific features.
>
> Implement handle_rsc callback to handle resource table parsing and to
> process DSP-specific resource, to determine if waiting is needed.
>
> Update imx_dsp_rproc_start() to handle this condition accordingly.
>
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
