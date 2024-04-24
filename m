Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B04615A4A4
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Apr 2024 11:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713959039; cv=none; b=rlJTpjuMNc0XGkaor/icxye1ZwVVjunT7nNt7HHczL4WsxgyB0mcHD7XCBiZMLPMvuuR/NBSGjc4pwgnNnWh6scxr+hlZ/kjuJjTp0moIqCs0XHrNnvq9ch6IQofQ75nEZ6GcQ4jwjyYnlKQM/8+4EqB2wWnwWJ00X80Z/HRPdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713959039; c=relaxed/simple;
	bh=GYlk1+xRFseC+luRkMEhNT5Sp6zI3DuEVd03JFhLr50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gJyPC1d5ESfQFGFxC8RYS67eYcJEifY34XvddrpxwCCFneSQXvg7pLAxnS8q1m/TGZF9aZNOZCI9BWf7pbjkl6cKRIHGMhZhPpaN/VuGYqpMS/HV5Voapu+boq1PAmzNJFxPUdnp4gXfKBIBURB60GeuTr6ZkkBAcVbc4UkpPJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YqVcRL4w; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YqVcRL4w"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-347e635b1fcso5523156f8f.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Apr 2024 04:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713959036; x=1714563836; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iu+03zqASN73X2rpLnZR44XtWtMSREKtu14xevxsIW8=;
        b=YqVcRL4w8uxG+DvE5eo0f7+9Gd3DeQgKs9f2HMTZrBHJAHYqAue5zM723/Jbb8FfaN
         +Q3N/j8GjE6zuCHJWfNkxVxTtjvvUsulOZhHxquuEx50+eeIoImCpxnWJKwfc7O7Zolh
         bPEaVf0raOG8aIPrUcrmMVWRC0In+7J3GcZtCtjPMlhPpRezF/nnVVm+djz7yO01DSo+
         lDQxTze6+hj/uJruJpeI4NNX4V4dP6KBmGL9nyysVc3vS6a3ISzuf1l7Y5NYwixQKJ9h
         +O6JJDfF3ARneHpI5FpDusUqqPTvLUQtFS1uY7+8tq7oB3X9MSDD6egMYhr0EB0Jessz
         0hig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713959036; x=1714563836;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iu+03zqASN73X2rpLnZR44XtWtMSREKtu14xevxsIW8=;
        b=d3w67WCPM0aiErCYRxAK2d6WeRzuAvg6kwzhzIUDNrK/WvpnlkfkMxuJKSZ5rmpj3m
         tPvsEHUdHb7X63aCoxfu2JAdVQrHx4vG3Dg3O+yVCsaqpYfqE1jRRc+RJ1bx3MTPBWip
         u4hlmHf24IbLQz3mUdYvtP/h+73Mm5v0FzuUfy22JJnM6kqc/VvHbhy8+28uXeSXwutP
         Vghq9MDg/5DwR+u+sva/eHTqdnUmIEXvhjsFIdInjUxDyKyvrO0SaIDsQxSxsmLAcew/
         yJdPJ4yLRyGzJ1IAx/1PTpWdOgddBZcBL84jjzZqPD571KF7COOz7+hHGgw26aC4XHR0
         iQHg==
X-Gm-Message-State: AOJu0YyEG3QJiv2ng50L9JilN3jYqvdbryfdu7hxn37oFcogxLkf5HN6
	tdqjIUstg+Td+//pcR20jhUd/E1iKtCt6aCSv/fMnOrjwttqxPulqmObAN3r3bY=
X-Google-Smtp-Source: AGHT+IFZc5yPohQaKcyx0+MotVNxpSJT+co5zkJXZG2ookFjyocJNCpyu+SV5bP+e3G41TLpcI8EPQ==
X-Received: by 2002:a5d:5581:0:b0:346:305c:b0eb with SMTP id i1-20020a5d5581000000b00346305cb0ebmr1498862wrv.22.1713959036231;
        Wed, 24 Apr 2024 04:43:56 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id h16-20020adffd50000000b00346d3a626b8sm17143490wrs.3.2024.04.24.04.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 04:43:55 -0700 (PDT)
Date: Wed, 24 Apr 2024 14:43:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: tanmay.shah@amd.com
Cc: linux-remoteproc@vger.kernel.org
Subject: [bug report] drivers: remoteproc: Add Xilinx r5 remoteproc driver
Message-ID: <77483e55-d015-4444-b6ee-95fbfb226fde@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Tanmay Shah,

Commit 6b291e8020a8 ("drivers: remoteproc: Add Xilinx r5 remoteproc
driver") from Nov 14, 2022 (linux-next), leads to the following
Smatch static checker warning:

    drivers/remoteproc/xlnx_r5_remoteproc.c:1088 zynqmp_r5_cluster_init()
    error: uninitialized symbol 'tcm_mode'.

    drivers/remoteproc/xlnx_r5_remoteproc.c:917 zynqmp_r5_core_init()
    error: uninitialized symbol 'ret'.

drivers/remoteproc/xlnx_r5_remoteproc.c
    961 static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
    962 {
    963         enum zynqmp_r5_cluster_mode cluster_mode = LOCKSTEP_MODE;
    964         struct device *dev = cluster->dev;
    965         struct device_node *dev_node = dev_of_node(dev);
    966         struct platform_device *child_pdev;
    967         struct zynqmp_r5_core **r5_cores;
    968         enum rpu_oper_mode fw_reg_val;
    969         struct device **child_devs;
    970         struct device_node *child;
    971         enum rpu_tcm_comb tcm_mode;
    972         int core_count, ret, i;
    973         struct mbox_info *ipi;
    974 
    975         ret = of_property_read_u32(dev_node, "xlnx,cluster-mode", &cluster_mode);
    976 
    977         /*
    978          * on success returns 0, if not defined then returns -EINVAL,
    979          * In that case, default is LOCKSTEP mode. Other than that
    980          * returns relative error code < 0.
    981          */
    982         if (ret != -EINVAL && ret != 0) {
    983                 dev_err(dev, "Invalid xlnx,cluster-mode property\n");
    984                 return ret;
    985         }
    986 
    987         /*
    988          * For now driver only supports split mode and lockstep mode.
    989          * fail driver probe if either of that is not set in dts.
    990          */
    991         if (cluster_mode == LOCKSTEP_MODE) {
    992                 fw_reg_val = PM_RPU_MODE_LOCKSTEP;
    993         } else if (cluster_mode == SPLIT_MODE) {
    994                 fw_reg_val = PM_RPU_MODE_SPLIT;
    995         } else {
    996                 dev_err(dev, "driver does not support cluster mode %d\n", cluster_mode);
    997                 return -EINVAL;
    998         }
    999 
    1000         if (of_find_property(dev_node, "xlnx,tcm-mode", NULL)) {
    1001                 ret = of_property_read_u32(dev_node, "xlnx,tcm-mode", (u32 *)&tcm_mode);
    1002                 if (ret)
    1003                         return ret;
    1004         } else if (device_is_compatible(dev, "xlnx,zynqmp-r5fss")) {
    1005                 if (cluster_mode == LOCKSTEP_MODE)
    1006                         tcm_mode = PM_RPU_TCM_COMB;
    1007                 else
    1008                         tcm_mode = PM_RPU_TCM_SPLIT;
    1009         }

tcm_mode not initialized if device_is_compatible() is false.

    1010 
    1011         /*
    1012          * Number of cores is decided by number of child nodes of
    1013          * r5f subsystem node in dts. If Split mode is used in dts
    1014          * 2 child nodes are expected.
    1015          * In lockstep mode if two child nodes are available,
    1016          * only use first child node and consider it as core0
    1017          * and ignore core1 dt node.
    1018          */
    1019         core_count = of_get_available_child_count(dev_node);
    1020         if (core_count == 0) {
    1021                 dev_err(dev, "Invalid number of r5 cores %d", core_count);
    1022                 return -EINVAL;
    1023         } else if (cluster_mode == SPLIT_MODE && core_count != 2) {
    1024                 dev_err(dev, "Invalid number of r5 cores for split mode\n");
    1025                 return -EINVAL;
    1026         } else if (cluster_mode == LOCKSTEP_MODE && core_count == 2) {
    1027                 dev_warn(dev, "Only r5 core0 will be used\n");
    1028                 core_count = 1;
    1029         }
    1030 
    1031         child_devs = kcalloc(core_count, sizeof(struct device *), GFP_KERNEL);
    1032         if (!child_devs)
    1033                 return -ENOMEM;
    1034 
    1035         r5_cores = kcalloc(core_count,
    1036                            sizeof(struct zynqmp_r5_core *), GFP_KERNEL);
    1037         if (!r5_cores) {
    1038                 kfree(child_devs);
    1039                 return -ENOMEM;
    1040         }
    1041 
    1042         i = 0;
    1043         for_each_available_child_of_node(dev_node, child) {
    1044                 child_pdev = of_find_device_by_node(child);
    1045                 if (!child_pdev) {
    1046                         of_node_put(child);
    1047                         ret = -ENODEV;
    1048                         goto release_r5_cores;
    1049                 }
    1050 
    1051                 child_devs[i] = &child_pdev->dev;
    1052 
    1053                 /* create and add remoteproc instance of type struct rproc */
    1054                 r5_cores[i] = zynqmp_r5_add_rproc_core(&child_pdev->dev);
    1055                 if (IS_ERR(r5_cores[i])) {
    1056                         of_node_put(child);
    1057                         ret = PTR_ERR(r5_cores[i]);
    1058                         r5_cores[i] = NULL;
    1059                         goto release_r5_cores;
    1060                 }
    1061 
    1062                 /*
    1063                  * If mailbox nodes are disabled using "status" property then
    1064                  * setting up mailbox channels will fail.
    1065                  */
    1066                 ipi = zynqmp_r5_setup_mbox(&child_pdev->dev);
    1067                 if (ipi) {
    1068                         r5_cores[i]->ipi = ipi;
    1069                         ipi->r5_core = r5_cores[i];
    1070                 }
    1071 
    1072                 /*
    1073                  * If two child nodes are available in dts in lockstep mode,
    1074                  * then ignore second child node.
    1075                  */
    1076                 if (cluster_mode == LOCKSTEP_MODE) {
    1077                         of_node_put(child);
    1078                         break;
    1079                 }
    1080 
    1081                 i++;
    1082         }
    1083 
    1084         cluster->mode = cluster_mode;
    1085         cluster->core_count = core_count;
    1086         cluster->r5_cores = r5_cores;
    1087 
--> 1088         ret = zynqmp_r5_core_init(cluster, fw_reg_val, tcm_mode);
    1089         if (ret < 0) {
    1090                 dev_err(dev, "failed to init r5 core err %d\n", ret);
    1091                 cluster->core_count = 0;
    1092                 cluster->r5_cores = NULL;
    1093 
    1094                 /*
    1095                  * at this point rproc resources for each core are allocated.
    1096                  * adjust index to free resources in reverse order
    1097                  */
    1098                 i = core_count - 1;
    1099                 goto release_r5_cores;
    1100         }
    1101 
    1102         kfree(child_devs);
    1103         return 0;
    1104 
    1105 release_r5_cores:
    1106         while (i >= 0) {
    1107                 put_device(child_devs[i]);
    1108                 if (r5_cores[i]) {
    1109                         zynqmp_r5_free_mbox(r5_cores[i]->ipi);
    1110                         of_reserved_mem_device_release(r5_cores[i]->dev);
    1111                         rproc_del(r5_cores[i]->rproc);
    1112                         rproc_free(r5_cores[i]->rproc);
    1113                 }
    1114                 i--;
    1115         }
    1116         kfree(r5_cores);
    1117         kfree(child_devs);
    1118         return ret;
    1119 }

regards,
dan carpenter
