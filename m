Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD65C2FF159
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 15:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567167; cv=none; b=H9cdyEPVq9p5EBSUk9lSe/Nl5lSTovgg+1KJhuFJlM64IjfLpsRPCzhdUJ6cvUYBYoa2vYBVftD55giKOmEtTIeuMohEtNxGg+FfThrjLTYjfhYrehegWYtCo5nAAGJYBE5Y9TobPLbAC1lqhvfmmVgFgpxgJvUmVAKikKmUGWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567167; c=relaxed/simple;
	bh=BG5tLoxomZq6QyZmtX+DmOmp49QzG4CslaIEh2rN2og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YOf2Zg9K+xMlPNb487vDE77FeCLfTB2IVp9Q3K5jFvbqvj6VsF9lA7ameSqQL4WGW7v/34HqygvyULDi07A2pikQztwHW6poPXUVzOi/Mm094zcGn3PcmHCIeu9wov9k2JAqGc3M04+PtRkFw5znctEbjwPyAoQkzn5HKzHcZ+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h67n1qs9; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h67n1qs9"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47755a7652eso46739285e9.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 07:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567159; x=1764171959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqVd/I23ujzds6aG+1Lfyj/OLmPD/Ehk8Zy8jv9bGeE=;
        b=h67n1qs9Ihf0s3aPMinZSRCAczRQpw45ihMWMfjlNIvhknSfGnG+w+mMTwEi2c4pVy
         DL0+rKrt3+DReC07qFokF5Zkip6Gxvmbs6ndgMAcyZWTrgMwyDTjzLCMzlMYA9iEa8Sp
         Qtv3Ml8J57ag90nIHGke7OMoWVl6pkSuHd+H9mOYHRulvjzQRwMtGgelh1C/+3AXs0Vp
         mPSyP3aEBR4pq7oTf94IHwIeM5TfZSJDalWq7B2Kt327N8QvEp4zkM/wHSsLopjX5SEg
         6CImGXk5cI/2l+iH0yRuOdj8QppJoe8lro4QThyAmtoqPuVU4Oz9R0Ce1/nthGUifyJ5
         gWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567159; x=1764171959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rqVd/I23ujzds6aG+1Lfyj/OLmPD/Ehk8Zy8jv9bGeE=;
        b=buNx65IUIvWtZrH9mlo2sPh96P4y5XUZRkW8lLyKoD9mnQJz1ytb+6z6JUK2fNJcYj
         rOXQ/u38wT0sux50j0AKf0+78XlqNYvRUuccmFWANOvBRL43nLqyn7U6GQvpFGnpikrk
         OADDroQSEM0WBBNq4q3oFgD3jUJLY3AN7o8XgK1XkRvIjI4ZK7NWWfwBd+DCnNBImdWw
         Txs7YU0DzGINfPDTwm9v3CTSKBNtakvJBRGU6inn/3fu+2VzGnBHPFGU5zZH94T+b4rx
         C3SrCEOg4MxgaflU/9G6KeTxfkMBGOmEXEFk5WrDmci7/95dH5wBF8Zak03P7XqKpC7l
         iJYg==
X-Forwarded-Encrypted: i=1; AJvYcCUDSYzLAIdj51EuiQulsE1TRbRQwjjyE+JQZHiBsQM5PXO4lYH9eeY6PfbMuSWLg/Z+Ygrkt0NMlpDe4XyEOi/4@vger.kernel.org
X-Gm-Message-State: AOJu0YxuzyLSWjGD82Ndox8nNtLsTBd5WOs4YIgG/fOgnLhh+dAmvA2V
	IYYySbGOEDhblBcMgiWIZdlBOfXCqzM+Z2Qw3UtYMmbgAs0kc2O+NGxrsM84/aDFKvI=
X-Gm-Gg: ASbGncuInJX5fgYaTEdttZJwUkVD79pJuiTxcfz3xA/HNXbSRanVIx9NO4lFCitt3mC
	snp2vEGeksSJyZJOikY5tjTgtcT74Nc21kw+KLTsl90BjHhDBTRb6lMtJHo2BQ4IHj0mzQc3prN
	QN9xdQvHqkPBkdtdIvqUwosTBoOvxkRxIyvarQqDCF/D7icxOVyrwJkQ9meimn9In31Y0TA+049
	kJODXM6ZmAzKnrB50hGsz8BzwJRu2LphFH9yzOIGDQPKb4X1f8U6FfA4t+ur9h0RvPL/g9nsJPu
	NGiLBTOA0zfziVvMCtru+vIm5KM9D6jJLmy5VJ1CMHiyGPlacgJP63V42jYgsTIiVTPjFJjbcFV
	5SzN5DLoKvuWBAgrInI+NGdWqd2/oK4PTTSJB3JouezEqIAd1SbiUXj5i3lpIPXq8hUXmbxgJP9
	wQ4ao4bpM1hi/fnv3EtJg//Il2vDYK9Q==
X-Google-Smtp-Source: AGHT+IETZCFytuhcxmwyAYMbvVQ+k0LcHrDBKuExYdhaEVzislepliPqczS5k/WGmFJtVck24Vggmg==
X-Received: by 2002:a05:6000:2405:b0:42b:3a84:1ec3 with SMTP id ffacd0b85a97d-42b5937ff2emr21375859f8f.29.1763567158737;
        Wed, 19 Nov 2025 07:45:58 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:58 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 24/26] soc: qcom: smem: Add minidump device
Date: Wed, 19 Nov 2025 17:44:25 +0200
Message-ID: <20251119154427.1033475-25-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a minidump platform device.
Minidump can collect various memory snippets using dedicated firmware.
To know which snippets to collect, each snippet must be registered
by the kernel into a specific shared memory table which is controlled
by the qcom smem driver.
To instantiate the minidump platform driver, register its data using
platform_device_register_data.
Later on, the minidump driver will probe and obtain the required memory
snippets from the memory inspection table (meminspect)

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/soc/qcom/smem.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index c4c45f15dca4..03315722d71a 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -270,6 +270,7 @@ struct smem_region {
  * @partitions: list of partitions of current processor/host
  * @item_count: max accepted item number
  * @socinfo:	platform device pointer
+ * @mdinfo:	minidump device pointer
  * @num_regions: number of @regions
  * @regions:	list of the memory regions defining the shared memory
  */
@@ -280,6 +281,7 @@ struct qcom_smem {
 
 	u32 item_count;
 	struct platform_device *socinfo;
+	struct platform_device *mdinfo;
 	struct smem_ptable *ptable;
 	struct smem_partition global_partition;
 	struct smem_partition partitions[SMEM_HOST_COUNT];
@@ -1236,12 +1238,20 @@ static int qcom_smem_probe(struct platform_device *pdev)
 	if (IS_ERR(smem->socinfo))
 		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
 
+	smem->mdinfo = platform_device_register_data(&pdev->dev, "qcom-minidump",
+						     PLATFORM_DEVID_AUTO, NULL,
+						     0);
+	if (IS_ERR(smem->mdinfo))
+		dev_err(&pdev->dev, "failed to register platform md device\n");
+
 	return 0;
 }
 
 static void qcom_smem_remove(struct platform_device *pdev)
 {
 	platform_device_unregister(__smem->socinfo);
+	if (!IS_ERR(__smem->mdinfo))
+		platform_device_unregister(__smem->mdinfo);
 
 	hwspin_lock_free(__smem->hwlock);
 	__smem = NULL;
-- 
2.43.0

