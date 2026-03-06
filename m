Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE72E2E11A6
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Mar 2026 00:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772757842; cv=none; b=BY+YCCeUhi0rOQqmYD90lSbdpfV4hJxDsBs201G7BWwm3IhKN9jLFZFZFphVeYtuEAMqIH5pty4kDz7VbSa0BNSZJUN1nglY0ga5mbmatal3ukQWZc90fqppLiFLYv+GWvuZMdGpsHf3qY51I808Lwn/7GfLDQOYBceAFt+QPYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772757842; c=relaxed/simple;
	bh=7+7vEfBpNq1FeJYJEFDLB71C+eZ7mjue1YQ1Lz4VM4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g+AopF/zFmcakvEbTHVnHn5OA6kGBOHcsvTiJm+4DGpHMwkwl6ZqY3WaYVvIFmWAv+qlIw5oLAftpX3qEm2fI+BZ5dB0ao1PK3hprXoMY1L+T9QQlA3MTJYrabWbnCn+J5+Ng4dnLP3VkT2I4dSOdTmVBbQU5dpoqdsM0xZ+aec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQGAv6Hb; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQGAv6Hb"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-413c2977db8so2442567fac.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Mar 2026 16:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772757837; x=1773362637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWzAa+zn92+13s1CRMtvzeiMVSLB+iLeHsYqLdK601c=;
        b=JQGAv6HbUQNC1gjJ68whaYfxEDPpib0XsPN+2anKdPc28e2ptzxcM3hqxmzT46NpY2
         PPtuI3H2L6L59816oobgEWbYekvQP2LfTM4/sRW1h43bIrp07lcDsuNfHX44FU+ehV+i
         +LCuYAodD48FRk+5efGiYRV25gV5RJev5yGxBjEQzbFTQcVjGgDWBCKI9X72iLKSEKlN
         n1/YRSCeps3tX/DcIBPfWGtCi38EX2GETIYpKuMTYWiEy8bDaISVoDKKMjvXOERox/U+
         sU+gUy3x/O/tdjFtGYk7BcXTjEmjCxTpHSPjZRSpipJP5lzvymZQbYSrQHs54BgHDuuP
         S1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772757837; x=1773362637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DWzAa+zn92+13s1CRMtvzeiMVSLB+iLeHsYqLdK601c=;
        b=mlxQAIDaoMI5+VZXimFq7u6WGlMSfYDwzklPsI6UMNcVdUnnPQvI/ZBcOmVERscFtp
         5YPS261wqMspbRsSeUnLapvfW6F+bsFW4F9RToRIzlmzXHxb5C4TKcGSGnxzXIR2UGyA
         PrVQ+oDAAusPd4NJO72h7+/O1wY6yhkSCjuFJeeaeo+vBPmXfCLZqY5ZkyGLdbCgIUA2
         73gIl052IGC5nFmlizm0/SWZ3vY32dD9QEom3dvpWYLuDd6Zo1upwCqHVgCxwcUeUt9C
         U16wYWdJNjJ20ytyhBdIOkzni3OOaOe8MJGIxwWY39uvIct9Wd8acvg/4FKzJPeoY8kJ
         rkUg==
X-Forwarded-Encrypted: i=1; AJvYcCXHRBnN+szGx7YTpARVP+NwVkygncOg3jdlIwe0IwirBwQdCvjoYHtL220rNWB/Y6dfB2OVXy6GyxLbk3DL2K3h@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+FB3osEhqpTYfP6o4WPJ1KIhpCDKFmXxPAcEFxGI9avcGxKyF
	0oolg1VRdDICJGws3Fji5zimfMboiUM7Wxf/vr94w/VfI8TMNGMr+Tg/
X-Gm-Gg: ATEYQzxE7Ke7NxSPpDsbR69U9qe1VrtETMWvqZ7YDW0kEa//urEY4i2b5eLPMx+lfy0
	oaMOnc6cGKenQuuTyfkWo+nHJvy97gDWtLf/8t8ldGVhV8+loF7eT6Q3V0M45urub4tn6b1AeNv
	We52bFhVnWdTErQaSLXHtGz7ieMLjCqLzxM1hUv0Qky+l/Zsms2EbFbqNdhVdWIdiKejWn/WqkW
	gu0knublsorwhbVs+dYr1uIseeFU3b1m0oYQ4qykMLFYSSDDAZtM3LR7V9j59h0Lhtqgfw/Zv+d
	2l+fps19dfnErAffn38xCp61MY39KgCO8pLa2nJTqnWDUKtQrLO1QMSPiC4wJ+EooItx1AD22K6
	G7+AN3cqhHkm9z0MZq5K8N2V+wHhWtULR8bA3cmkq+cGFwsCecB3d8AsYX6eLBxm78VbesBgmeU
	C+XCCXscUrrI1UCJMGbW3HiXbx5zREjK/V+SyV20zztxD3+6+U4Zj/NjC8kYbcUbVV4/pS8HXx3
	HCA2aFgD85zan8gHdTGu1VEu25b9LvIoP67e+Es3Yq+bnQoAvgM
X-Received: by 2002:a05:6870:8252:b0:3e7:e420:6229 with SMTP id 586e51a60fabf-416e3e6fa13mr252903fac.6.1772757836776;
        Thu, 05 Mar 2026 16:43:56 -0800 (PST)
Received: from framework.misc.iastate.edu ([2610:130:110:25d:2aa4:4aff:fed7:9b19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e65b1c82sm69335fac.5.2026.03.05.16.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 16:43:56 -0800 (PST)
From: Kerigan Creighton <kerigancreighton@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	wcn36xx@lists.infradead.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kerigan Creighton <kerigancreighton@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: remoteproc: qcom,wcnss-pil: Add wcn3610 compatible
Date: Thu,  5 Mar 2026 18:43:42 -0600
Message-ID: <20260306004344.10968-2-kerigancreighton@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306004344.10968-1-kerigancreighton@gmail.com>
References: <20260306004344.10968-1-kerigancreighton@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm WCN3610 is a 2.4GHz-only WLAN/BT combo chip.
It's similar to the WCN3620, though more basic. Add a
wcn3610 compatible for use in device trees.

It needs its own compatible because of chip-specific
configuration done in wcn36xx.

Signed-off-by: Kerigan Creighton <kerigancreighton@gmail.com>
---
Changes in v2:
 - Move the Documentation patch to the beginning of the patch set.

Changes in v3:
 - Describe the hardware rather than the driver in the
   dt-bindings patch [Krzysztof].
---
 Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
index 117fb4d0c4..018cdf5177 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
@@ -109,6 +109,7 @@ properties:
     properties:
       compatible:
         enum:
+          - qcom,wcn3610
           - qcom,wcn3620
           - qcom,wcn3660
           - qcom,wcn3660b
-- 
2.53.0

