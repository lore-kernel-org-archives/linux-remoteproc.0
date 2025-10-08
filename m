Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5942BFC7B
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Oct 2025 04:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759899528; cv=none; b=gm0CGS5z8DQIfiwcS75YjXnmPyXi8gIU6lYw7rm4c/FcuSG7SAJAyE4YGir7MIV6IHWAwEbKVwpRJKHKWDOsY/U0wsuH4FhvfSPdveuL3yborA/LWdm3hR4+M6UNPPmIbbijYDxIscRT2a+6nWhjiTcvmn5IzOk6AmfwBgU0Jkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759899528; c=relaxed/simple;
	bh=kVfA3PQBeAMY4VR/yirMkB1CU+nJ+TFUfcnv0HBDb8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8sXMhNBv52PXaKWmr4i4Nvwk8unfPjNK0yrAQW9IqDsB5EMyCQII06BVjZTd/947NtkBudgcYIj6HDhAmJMx2WluQMIG1v1RKzjA/OcM4DdttW4jkyiag87BLpiq3+Vsfqz/tgV4dkLmS7cGtsfkEzs96oqQJC+2036HtWKDkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBdKkmjJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBdKkmjJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59803d3I018793
	for <linux-remoteproc@vger.kernel.org>; Wed, 8 Oct 2025 04:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3QbTQI2WQv8U2fmkSw8SyD76J79giWpu9JljQPYNGIk=; b=TBdKkmjJXE31Cvcx
	tOgQCYSfCLJbxkHZaNMzQo3XTB3Udipr+fxaBcg2y2RCRq0hUIhhQ/mh7m4ctBuz
	2xSa2fR3zpKjvKTBvy6CKpgukNtanCGxWyXwuX0vDf4HaaDTdAlg2D2jMRHn9u6D
	QSFM1HASaiH063Vfw6y4hZyEfQ/1gFLu+J815tJZP0gO3JJ0LOG0zvCF8/Z7g9kN
	HX0kUS/ozLT8Z3isHkAl+uSsyWDUS8g+z21rIMlQSpI/zVzaRt8cd0F0LKyKTPU5
	7xfbscFojMdGJGSmqmlKlt5z7Qc8TYCWBwqiHmOi8rkk+sREw64vB0kGNpKadoTF
	s/MugA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgsdfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 08 Oct 2025 04:58:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-780f9cc532bso659238b3a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Oct 2025 21:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759899524; x=1760504324;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3QbTQI2WQv8U2fmkSw8SyD76J79giWpu9JljQPYNGIk=;
        b=H0/ZSnb/xolODFESnEf6uyl0gsQh0sfinYcySlqq2WlmEuBMzZXmEb6iX7yepYJyJs
         7r8m1/emj6fj4QhhvOTkNx3JRgbvKzVHV7JEadqk9v1wD8D8I7mBDwbyQnibuO8AZY5V
         9+XFxB6/4q6WCuSGxiih/d/XId6F6aEG3zyfnuZFyn8iqPRjcTzihsG2cN6i8B8ehIHB
         7IyBiLPVYsx+zWMTzBt9cWOgpybf/mn6JZOgGLLH8mYjPuLkDN5ShG/GryOaxmaEiH9H
         up6Do2EL2h6DP1QirN1TGdUKX0Q72lZLt7p29cM4AuKY4Y9fePGboHURbRNLS/H6N4+U
         J5Hg==
X-Forwarded-Encrypted: i=1; AJvYcCVdnCLxxgRNaJm5uKhDaCe5Mz/0vizIWLPq5Ceie+US/u4Bx9FD+PLWpwnK4L6YxjVoWKuE25EPWjnE107omtpq@vger.kernel.org
X-Gm-Message-State: AOJu0YxtRCiK8ZMoCPRIj7EGZwFyblhrDALjgUDUPZg0pOgQEF9Lf7sT
	PcMUzap0A/L2HZNk0CtOSqysG15xIZA3oQmYczSX/Vt3++K1JhZyBfz65s8h06kNBWQyYwXcDI/
	/C7oz545MPgZsdAoBwIt0aS727vjrmh21wdLx0jkNvxCQeZYVXATlsKo1xiPJnPbnm9M+ZKLw
X-Gm-Gg: ASbGnct57ft8U41uVYWQqTkEOz+zxsTUw6j5YGJofN8V32WkHYOvqD+Qa4ExvDLjn3u
	P39ETaqJikfH/OHEIYtpTQg4AHr5MS822TlKnxlT+DlMZKG2PX3kown/5QIgCZRJ8+o+8NdcTFG
	FMySeEg+xnel6LZnKHuCGuNtm0Jm7rgsfOK4ykhBtPYWwL4VVcx8qfwTDj42+Y5f0pItNSqje7j
	Dob9y5dV33IUENg1KYhsW6aMTyR88i3tyiWGxFhYg/4hdICTa42ueY22sr8sQsyKH9aVx/y4zqp
	xHyFjIzvsFJ7cCsL0g4G975p/sEk697MWmk2bQlDi8qvSdK432EN7ZlphqQ9r6Gjats0UGGB
X-Received: by 2002:a05:6a00:806:b0:78a:f6be:74f2 with SMTP id d2e1a72fcca58-7939753d3cdmr2164047b3a.5.1759899523398;
        Tue, 07 Oct 2025 21:58:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPyL1wtsIL9oElD/vW5F/NgaqYtaOb0BSOZcSEm/R3DuE7PYYnwUFcC3CApID3Rwt+++F4JQ==
X-Received: by 2002:a05:6a00:806:b0:78a:f6be:74f2 with SMTP id d2e1a72fcca58-7939753d3cdmr2164005b3a.5.1759899522532;
        Tue, 07 Oct 2025 21:58:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b020749b6sm17406444b3a.78.2025.10.07.21.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 21:58:42 -0700 (PDT)
Date: Wed, 8 Oct 2025 10:28:36 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 11/12] remoteproc: qcom: pas: Enable Secure PAS
 support with IOMMU managed by Linux
Message-ID: <20251008045836.vf4wz6cevosw6klq@hu-mojha-hyd.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-11-de841623af3c@oss.qualcomm.com>
 <fo6q3gl3dmcso5gcfp2taaao3qwazxw5uutkcwi6qg4aojt2av@tprjv3xhcs57>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fo6q3gl3dmcso5gcfp2taaao3qwazxw5uutkcwi6qg4aojt2av@tprjv3xhcs57>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX1SvKMYJnHWaD
 XRdsWh67D6gYoOEfR5JUgXcQQrqRwi8NgrYCmwwxMJqQfep+n7IBYwvdYUW9T6jo2gPENQU1MrB
 VyT2Yfw1TL/t82p95KqqMlofnzYKTKrYvdphY/KQUv3EsdR15kNwj8rtYsE+h15FYqOw6n1W4JH
 zs+QN0ReY6RcDQrQRkjQFB+wVk8liEacOhJdrRbiERwvBLlWRVxSxY5BFd1UHn01cqwZUUoBJf0
 ox53TkszGgvNP55tjOk17LQazBECwmkjPObh81c3bzkbVv+OPhJDmyqVLdYpzNGBHC+on17u/O2
 QD0Sx4leXA9fNn43bpMsw9iK374LdkWH1nlvD7sFi3K19LQ3XBPv3yFgJnbyBtA78o32bBl+GmL
 G4IwbZlct2Z4C+VKbLTRHR3IriSEYw==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e5ef85 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=kZm2_AX0drxy1KB4Y_MA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 0gaxHwNTJUQDMUBA4vMstB3s4iSRY2bU
X-Proofpoint-ORIG-GUID: 0gaxHwNTJUQDMUBA4vMstB3s4iSRY2bU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019

On Tue, Oct 07, 2025 at 02:52:13PM -0700, Manivannan Sadhasivam wrote:
> On Tue, Oct 07, 2025 at 10:18:56PM +0530, Mukesh Ojha wrote:
> > Most Qualcomm platforms feature Gunyah hypervisor, which typically
> > handles IOMMU configuration. This includes mapping memory regions and
> > device memory resources for remote processors by intercepting
> > qcom_scm_pas_auth_and_reset() calls. These mappings are later removed
> > during teardown. Additionally, SHM bridge setup is required to enable
> > memory protection for both remoteproc metadata and its memory regions.
> > When the aforementioned hypervisor is absent, the operating system must
> > perform these configurations instead.
> > 
> > When Linux runs as the hypervisor (@ EL2) on a SoC, it will have its
> > own device tree overlay file that specifies the firmware stream ID now
> > managed by Linux for a particular remote processor. If the iommus
> > property is specified in the remoteproc device tree node, it indicates
> > that IOMMU configuration must be handled by Linux. In this case, the
> > has_iommu flag is set for the remote processor, which ensures that the
> > resource table, carveouts, and SHM bridge are properly configured before
> > memory is passed to TrustZone for authentication. Otherwise, the
> > has_iommu flag remains unset, which indicates default behavior.
> > 
> > Enables Secure PAS support for remote processors when IOMMU configuration
> > is managed by Linux.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_pas.c | 61 ++++++++++++++++++++++++++++++++++----
> >  1 file changed, 56 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index ed7bd931dfd5..940fd89d4fc4 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/delay.h>
> >  #include <linux/firmware.h>
> >  #include <linux/interrupt.h>
> > +#include <linux/iommu.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > @@ -255,6 +256,22 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
> >  	return ret;
> >  }
> >  
> > +static void qcom_pas_unmap_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
> > +{
> > +	if (rproc->has_iommu)
> > +		iommu_unmap(rproc->domain, mem_phys, size);
> > +}
> > +
> > +static int qcom_pas_map_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
> > +{
> > +	int ret = 0;
> > +
> > +	if (rproc->has_iommu)
> > +		ret = iommu_map(rproc->domain, mem_phys, mem_phys, size,
> > +				IOMMU_READ | IOMMU_WRITE, GFP_KERNEL);
> > +	return ret;
> > +}
> > +
> >  static int qcom_pas_start(struct rproc *rproc)
> >  {
> >  	struct qcom_pas *pas = rproc->priv;
> > @@ -289,11 +306,15 @@ static int qcom_pas_start(struct rproc *rproc)
> >  	}
> >  
> >  	if (pas->dtb_pas_id) {
> > -		ret = qcom_scm_pas_auth_and_reset(pas->dtb_pas_id);
> > +		ret = qcom_pas_map_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
> > +		if (ret)
> > +			goto disable_px_supply;
> > +
> > +		ret = qcom_scm_pas_prepare_and_auth_reset(pas->dtb_pas_ctx);
> >  		if (ret) {
> >  			dev_err(pas->dev,
> >  				"failed to authenticate dtb image and release reset\n");
> > -			goto disable_px_supply;
> > +			goto unmap_dtb_carveout;
> >  		}
> >  	}
> >  
> > @@ -304,18 +325,22 @@ static int qcom_pas_start(struct rproc *rproc)
> >  
> >  	qcom_pil_info_store(pas->info_name, pas->mem_phys, pas->mem_size);
> >  
> > -	ret = qcom_scm_pas_auth_and_reset(pas->pas_id);
> > +	ret = qcom_pas_map_carveout(rproc, pas->mem_phys, pas->mem_size);
> > +	if (ret)
> > +		goto release_pas_metadata;
> > +
> > +	ret = qcom_scm_pas_prepare_and_auth_reset(pas->pas_ctx);
> >  	if (ret) {
> >  		dev_err(pas->dev,
> >  			"failed to authenticate image and release reset\n");
> > -		goto release_pas_metadata;
> > +		goto unmap_carveout;
> >  	}
> >  
> >  	ret = qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
> >  	if (ret == -ETIMEDOUT) {
> >  		dev_err(pas->dev, "start timed out\n");
> >  		qcom_scm_pas_shutdown(pas->pas_id);
> > -		goto release_pas_metadata;
> > +		goto unmap_carveout;
> >  	}
> >  
> >  	qcom_scm_pas_metadata_release(pas->pas_ctx);
> > @@ -327,10 +352,16 @@ static int qcom_pas_start(struct rproc *rproc)
> >  
> >  	return 0;
> >  
> > +unmap_carveout:
> > +	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
> >  release_pas_metadata:
> >  	qcom_scm_pas_metadata_release(pas->pas_ctx);
> >  	if (pas->dtb_pas_id)
> >  		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> > +
> > +unmap_dtb_carveout:
> > +	if (pas->dtb_pas_id)
> > +		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
> >  disable_px_supply:
> >  	if (pas->px_supply)
> >  		regulator_disable(pas->px_supply);
> > @@ -386,8 +417,12 @@ static int qcom_pas_stop(struct rproc *rproc)
> >  		ret = qcom_scm_pas_shutdown(pas->dtb_pas_id);
> >  		if (ret)
> >  			dev_err(pas->dev, "failed to shutdown dtb: %d\n", ret);
> > +
> > +		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
> >  	}
> >  
> > +	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
> > +
> >  	handover = qcom_q6v5_unprepare(&pas->q6v5);
> >  	if (handover)
> >  		qcom_pas_handover(&pas->q6v5);
> > @@ -757,6 +792,20 @@ static int qcom_pas_probe(struct platform_device *pdev)
> >  		return -ENOMEM;
> >  	}
> >  
> > +	if (of_property_present(pdev->dev.of_node, "iommus")) {
> > +		struct of_phandle_args args;
> > +
> > +		ret = of_parse_phandle_with_args(pdev->dev.of_node, "iommus",
> > +						 "#iommu-cells", 0, &args);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		rproc->has_iommu = true;
> > +		of_node_put(args.np);
> > +	} else {
> > +		rproc->has_iommu = false;
> 
> Default value is false, is't it?

Thanks, will drop the else part.

> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
-Mukesh Ojha
