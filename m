Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCE1535FD8
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 10:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074615; cv=none; b=QskZcRu9Qj7W1rdIW9xF7Lhwi0j1iTWA+6RLh/JSs5JGsE29fzJWTxxg+kCGulyCrrklfJdLZRR9KUb/8e1ISkhj3GPJn0l+7kCkoxz2qSIASSniqiyvQj+73xOpdyoBcXVCUw6X8VjmbQ4KWcCw3dF+4dqvnGjb8sAc0gb26Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074615; c=relaxed/simple;
	bh=dPFDKwpLdYY6Xz8/aXlHfyZiX/t8VPMj0bgY4zGFzSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Duuz3bgS4p9yHfuotWqGQlTZ8qYm7CABjBbDVWHSjC4N1xV98hi07TAB7GrujPd2VGodp6uxSz/PWTYsjfpv8rBIou/b2IPgjrKZsxYRiuEpLAAfosDzb3CUmiw8EcYXMV6TlufhGODTw1zabO/mpspYeH9AOdT/J6A8/6soJd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xc5zusmJ; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xc5zusmJ"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8631d0023daso2939234b3a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 03:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790074604; x=1790679404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dPFDKwpLdYY6Xz8/aXlHfyZiX/t8VPMj0bgY4zGFzSQ=;
        b=Xc5zusmJ1eWaGLIjBC2u9R9gwo0INyOkC3WgJhsX25ETi0brFfnUbVvClI5XbqTJ1X
         sZ8RtTrcdiENGehZOawo6b3Do8CPG7cJUTEsrlyNYEpurdXXVjg/6nSi/SVc2rpj+2uo
         rKmVp1JaYLzmCg021O7GkcoOFHKjKsWgNRm2LEW0uVdgQWWv49Ov3R/Y3vIO+yGZE+to
         Si3c+OMlWJ99apZqQFOq/JZP1Uoa5ffJUj7uPUSCWImiAgiZvQdUrF/mz/DEcslod/cY
         QeEYS8JQNBs21uY9NRqS46YyZf+YAQSTCxZH4BIClIgcOHMtOplIW1T2OmY+iFVvO10v
         aSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790074604; x=1790679404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dPFDKwpLdYY6Xz8/aXlHfyZiX/t8VPMj0bgY4zGFzSQ=;
        b=JJGiomIII7vHcD7IYvm1cJ8Xv6PEvA5kco32gxFGvgIAF/M2iqDxw150V7pTN39RYD
         Jx+MGCUfquu3EEELkB7xJQy9vfMYPF6k28DNg3qj2Yr1/cjmN/ObAWLGW21KCYma3t6+
         MTaPWb++jHYY+XIptYg70pKuNs2Y11NhZ8y6p7LXspOCr0sMYFv99pDyXa7kRDJhkRxV
         gMksHEKZUhmg830B4G9eInJntUaig3XGLWgU2K3lkMjZoObDifkDgMKTUyPjq+5E5VcF
         P6NDkjA8o/ebQbMaJbXQpAj23fttsBLAyDkBHx7OPi8XTC7ZwwfzoSoR9TlWm+3y57Tg
         kznQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbC2y/g4W4qzcLCRyKAZjh+S6L94f2nm0p8UwGGpcYEE1rB/Vhev8WM7scxy+OVWYPmOchvXyAAvmZ+zI+Lw5O@vger.kernel.org
X-Gm-Message-State: AFuF++kZBcc5MGYPJduNxjPZiIsbWl5NNmvdO1J5jOgV+wwt7yYLGtFM
	2YFnRRWc48tF9zdX5EOKd2Ghm//gdXK4KUUGfdqGL0NOj994b4G7GFGs
X-Gm-Gg: AYBFou3lTwySZG5ktfm6LjERXGInWZ81sKovsupnPOh81xVh1QmNPby8vudGGFmr4Wc
	q5BT1tORPWsHiF0+UAX3O1GLQK3phxlel/4UoxU6XUV76wUDgrYbLn2clgGtVQgCNHxpe9vgoGI
	tUG6AlibAgj4pKkDdOMSTs+RZaboNgqqKcRMYCh6EznfLq17hSaq3OuLSfjUB+Ln+b2jE78gxqZ
	iV+xYb7ZVBBrRjoUuLQfSxSpL5eUfNzBthWBxpZ22huW3C6Whl89JG9xCEJ6H+asjMDClcuNkYn
	7gNk1P2Uk7bWgjCGyYMcQgqkGTTWwx63uDWbxRjT6Hy9TB0v8JTanQZI6XS/Om4pbT5x1h5sxj5
	2EBtNYNYRSfIqqSSVMxaVn9H9q72fYfS6jETel7Dsj0ws3ezW7MMbWudVeh9v8eTXVOds867Ddm
	S4FTzckdGAhT/m1a+mUsTCzM0Spxr0+W4LN9cqPiF+c8Gl49D+xydFLJfjMCVi/e5/+FNYLkTUb
	Gi+eoUzAy1twvg5YEAzL0Si7mk=
X-Received: by 2002:a05:6a00:3001:b0:872:cadc:bdf2 with SMTP id d2e1a72fcca58-87c81ec0039mr736727b3a.14.1790074603769;
        Tue, 22 Sep 2026 03:56:43 -0700 (PDT)
Received: from urmom ([1.54.70.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c2fc4baf1sm653791b3a.6.2026.09.22.03.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:56:42 -0700 (PDT)
From: Lucas Sproule <lucas.sproule.42@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: qcom_wcnss: Fix error check after devm_ioremap_wc() switch
Date: Tue, 22 Sep 2026 17:56:36 +0700
Message-ID: <20260922105637.1684691-1-lucas.sproule.42@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831-wcnss-is-err-fix-v2-1-5520fd4c6b50@gmail.com>
References: <20260831-wcnss-is-err-fix-v2-1-5520fd4c6b50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bjorn,

Gentle ping on this one. It's a small regression fix and already has
Konrad's R-b. Happy to resend if that's easier.

Thanks,
Lucas
