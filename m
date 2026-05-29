Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB82F33BBA7
	for <linux-remoteproc@vger.kernel.org>; Fri, 29 May 2026 15:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780067667; cv=none; b=RtloWnquPjRMMq7EuyPaaDFNRKJenWOq6D6K1E1dOeJB+Ubdq6cIBJP7/NCXXA2wwbDgpBLkVpNck6eEULisWJXRxNS7NlaQlJIeXQbEIRy+MCiA01uC118FS2PsPgPKqeBhvarVemqWLytlOmrTaQbZ6ToAtsWvYqkrj6fxfg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780067667; c=relaxed/simple;
	bh=JgHz+6t+/lLVkabEsSU683KM7P90wDLARi+pbBBrukI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HuX2hrbQp+f+CVbqjixhm8w5zAtWCsbm+mWVWQ/klVAm8maTJdBrf7UwIuF8CDXdcGkNtrXOYz+xcZYMs9ZQRiGs7AqLaoPCmYw06qH3AYfSp6ioo8hzv9Y4WqCEjggQOjvT7ZGTsAEoiX/KX9u6WQUFPsHbDxKgDVumOZz/CVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=svoTaiG1; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="svoTaiG1"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf18c30bb2so9019505ad.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 29 May 2026 08:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780067665; x=1780672465; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CjGV1ydNT4vhjd08DNoiUIAjJm6vDoz197TfHBqCPyQ=;
        b=svoTaiG1kUykeMA6SaROpDrCS9Rv/ISQQLUOzYdtwXT6u80lFH70qZHu/Je3yQMUy7
         jSuXlzzqN9qVmh81HJfQpVYOZ12SBXlyQt7/WF+PMOmZRaqCW1Nrjp0vfDk5kJ9r0+AH
         8Kk1Iz4nTeiX3l/HJ6OjgJN3PmePjyTnvt9uwf7TH/3JD5QKftcD1LETMV+X3XcAeIxO
         pgmQ9pPw9kNVRUvxJKsD6sqa4RWwxsoYYn+blNrx4b+g8IgbTr4DYEOI3XN2LTjWoX4G
         q2IGlGsFxzowitBVbFCiCxsfjMdV6/Sv/OsyLgcg1qxWOXj+VJ5ovZwEvG7ZCf+wccPx
         gi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780067665; x=1780672465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CjGV1ydNT4vhjd08DNoiUIAjJm6vDoz197TfHBqCPyQ=;
        b=fZ1zDC4nYP8r+Qw+j4JdLBORrwkcrJ20zHPD3IvEnQEaitRjtxkuhYpZCR1YALwT3T
         aMPVZ8wT5CtAG1CGM+B2MifvqN+PBH6J0Ytj53p7BYkry0r3Uo0oYmYUTCcjW3R6OKU3
         TaAg0kAFSM9D+i2X8N+zklOgih7FjX0peUaKCfUQXipadXB730RrYmz9F8x4QA3jMBGa
         85vW8EyKeHFwANweslNMkDcsuIIypKz6cMRlhstd7TD/hkmY1w4nCyrCY6tU4ix4j9yC
         mbcKyiSSeAVoZ9SVzaZXtZKrvvUHJJBC4UtNdmvmEYiJoLA4KscEWq9QuV/ECuoYjE/k
         LRcw==
X-Forwarded-Encrypted: i=1; AFNElJ8c+hB3edKGxbU0WrquxkwNF7dlai8cr/CrkDN2lZjpS024OY8mF0cv/exaU6AjZBDNc/KSQUoaAKhiMmdofLiI@vger.kernel.org
X-Gm-Message-State: AOJu0YzCKu/SisKu5MZ6J1/VVjCZ9TBXj+KB2jvqD9IyxddwKWnhcGYm
	eSiq42ViKDaXIVaTVWuX8b4NALeYTvToa+gwbVb8Zn8eEiutZhdEjfCKLB9rjDdZY40=
X-Gm-Gg: Acq92OH23wLpL/u7+6ex6tpVTKWbonCRIiiq37IXwUE8+5a0nUxt/pwnfC18Pw/uZkW
	7NyIPuGfoHbkUdbHGjGFvErZmFrRnCY3EFsobnr+7juZ8jJBoFmwg/CNNV4EoD8RxrH1Z7Xw+mo
	nFPqfTn1rj+JrIOGpvrjHBkEHYZk+oXu3mIHJyh1WiJOz/dJwW+zZScR5GG2FXEyQqiaQxzEksn
	R3lamzzeeG23C/S3rsCNqAydK2kaR92GNdLye+n1hK+cEezpaZ5f/HWu08uibQbdd6D7qfapozx
	JkgRA2DOGLM4OPagI9Uo+5qQJnIoa8IIrtN8eLVSAXbPLzY6agI9D7SyoqjDDkTDKMSECRPoZ5s
	VwwVnm2U9/NwwKwPbBbQy8wbqleR9vg2kUenjxrTiZFXf733RrKJH/HXcgEWvTD8eUqEmSdyx+F
	pDLe09LCEtDQai0/KlA4bqPSyNye6oescpH6K/Dw==
X-Received: by 2002:a17:902:fc8e:b0:2ba:839e:15cb with SMTP id d9443c01a7336-2bf368463e6mr2923465ad.27.1780067664889;
        Fri, 29 May 2026 08:14:24 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fe93:5096:4a36:4399])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e5d83sm24992375ad.8.2026.05.29.08.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 08:14:24 -0700 (PDT)
Date: Fri, 29 May 2026 09:14:21 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, michal.simek@amd.com, ben.levinsky@amd.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] remoteproc: xlnx: add auto-boot support
Message-ID: <ahmtTVp9Kv2ZH-Ds@p14s>
References: <20260527051611.194844-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527051611.194844-1-tanmay.shah@amd.com>

On Tue, May 26, 2026 at 10:16:09PM -0700, Tanmay Shah wrote:
> The Linux kernel remoteproc framework provides auto boot feature. When
> enabled, the remote processor framework attempts to start the remote
> processor based on the firmware-name provided in the device-tree or
> attach to the remote processor if bootloader has already started the
> remote processor. Enable this auto boot feature for all AMD-xilinx
> platforms.
> 
> Changes in v3:
>   - add more descriptive commit message in the patch 2/2.
> 
> Changes in v2:
>   - remove the auto-boot property from bindings patch (1/2)
>   - rebase on latest remoteproc for-next branch
>   - refactor the driver patch (2/2) and detect the auto-boot runtime
> 
> 
> Tanmay Shah (2):
>   dt-bindings: remoteproc: xlnx: add firmware-name property
>   remoteproc: xlnx: enable auto boot feature
> 
>  .../remoteproc/xlnx,zynqmp-r5fss.yaml         |  4 ++
>  drivers/remoteproc/xlnx_r5_remoteproc.c       | 48 +++++++++++++------
>  2 files changed, 38 insertions(+), 14 deletions(-)
> 

Applied.

Thanks,
Mathieu

> 
> base-commit: 90de217305800ff32df4c0308e240925c8deb385
> -- 
> 2.34.1
> 
