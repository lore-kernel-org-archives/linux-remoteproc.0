Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBD2374195
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Mar 2026 07:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772782517; cv=none; b=GvqVoS+XWplugHiHyLIbvdrL5LgsBBhw8AkC91mqR2OakIVrHuCzltG31C83n9bY2aIsYbMI2AutCZ1+S3798ymgFXdo0uTrDANIEC6yOO8pbg/smgYviGGXuLIeTHUVAmDOMFrryVEAKte8X6uG0pzu02skn6yjI8so5nNiJ8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772782517; c=relaxed/simple;
	bh=6UStxTN0ltHJ/GkEo7bx/EfcLlbOuCrV481hg4emXsc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Y+ttAJvXuh/wFUhB0DbnvXRAUw9RzyoaYoxZRza6vTrbtqmEPX65Q19CdLaC4Y0E5CpgrFGcm8z55MQ6M4/Jh/meTk67c/04/RshAeK/uKkRlYDnGT88+4hW6+YHiVMMypTnCjRiyqTGFJQupL8mfaN4k6674ZNY26hgJhyhoN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EM40PIl3; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EM40PIl3"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso76806035e9.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Mar 2026 23:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772782513; x=1773387313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6XoprPGy2obVCQE2uQgSeOts5auhhet8rC7x7T+9nI=;
        b=EM40PIl3oC8AvBM9s2nfJZo4h6hSmBkn1M3E60cXyupESAl/YpD9NcmBBp9xHqzvXP
         cVg1ms4rFDZH2YdNEIGFWeHchjBTPrg5aLsWX3Ix+UhXFKUOEcOcYzs1eZzPTdaoL/7+
         DWMn1/qN031qigecNUIXfnelZwDK1HTweTTcFkFd8oqbLH2Lk9sIn7uPwVCMAS9LhOot
         Gjr27j8tye7Ku02D94lqefFgmF3UniDvYfOvGYTTRJ0Ap8QZJNC2oohC6hpGZ78bP4n0
         ATCoCadkhQThOTpioqDYEA8qsE6xvakPTRBV+DQm9ah9MSEld+m+F1JBNEFwwtM8AvXI
         bQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772782513; x=1773387313;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6XoprPGy2obVCQE2uQgSeOts5auhhet8rC7x7T+9nI=;
        b=geQGhgmYdA4qx1NjXnVYPE/QRi/qw90WIVJC1EhEXuYcejTApRfEaxjKyxkx6jFRGY
         fzSDWEFTuNkTID8/irj4z55uSedjOQDuhUTQqVWKZRS4LsB5bYInGTYNFRj/Px3AvgtJ
         /CPfNx1suQYH5fkrrxh9IhRMJgDyf4sOqSo0SMtwP7Tks/C519vLalvLXNtJILizWMPK
         WX48cH6uWDkcoQwMAxhWyW+Hl7H11US+CBHHWRGkuJWQusdv+HZJ7vLLSleqgh0bKvsu
         ZU6A1XwtSSKj5l5K7SC5YyL4qk8yI2+bQKHHD93ZzANUeMI/Y/hn2ZdWaMtU7ZD3yGCQ
         yo0g==
X-Forwarded-Encrypted: i=1; AJvYcCVjT+/7qgJnTf+vbp1uEsFRAO9smHk+BP0r6iCyUMsLaVoZ5VhPeurmED5JNakBm0NfXC0IRRTKqVhBhgyeUvof@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8MdYo2EU9HDzmw/gnNVV6pn/+x2EziDkx4twmvLE0DrA2gI6m
	rFTrtIXn9EjL9KjEA5UCYj9rQ3gQ3n9RBmVl+ZpyEdkpcky/RRreIsKv90+8oUZH9GQ=
X-Gm-Gg: ATEYQzyKFyjTKsyXmm/eqL2rK4Gbx6qIyS4Ky3RlsnVy9vxNdtLybNOXi3LESd0zk0T
	PGvqtP9qx24Y+4LLWjQL6+qu9VqGBw+BR4/T/x7TtrIhi4ImrMfLuvBvIv0DHr1NYVhMFxYkw9F
	WolF55rZQSF6wQwRFVDPEqK85mVtpPJuL/w6tScYRd2F+n4zwAeGVR/4KhGvQZ8rlzoi0obfABX
	We1DkknYHglOPqUl3rKh2hfyCPWL50b2nHcQXzeaRKBAzp0OyXFjehO+qJ0K3tFOpKTuuQFSCbf
	txVbno05YDdcJzyqqc1+HC95bVptI0bwGlh4U6Owa9qvkvH26aI6DaCektKoBgabPtXfY+TWbul
	LHKO3IaX9wsxNRPujxy3rEur3gphsjUf8vhzYNsfrpqa/XtyJrP/DgnscGjEjHdkHxEEAQPlQ3y
	OcPvjkNRbSACGnxigk7J5duLq7L7cUfjcF7WCfgnA=
X-Received: by 2002:a05:600c:4e89:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-48526951430mr16785555e9.21.1772782512990;
        Thu, 05 Mar 2026 23:35:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2bdf8sm1953812f8f.25.2026.03.05.23.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:35:12 -0800 (PST)
Date: Fri, 6 Mar 2026 10:35:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Shenwei Wang <shenwei.wang@nxp.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	arnaud.pouliquen@foss.st.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com
Subject: Re: [PATCH v9 4/5] gpio: rpmsg: add support for NXP legacy firmware
 protocol
Message-ID: <202603060910.Q5zBquzF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304211808.1437846-5-shenwei.wang@nxp.com>

Hi Shenwei,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenwei-Wang/docs-driver-api-gpio-rpmsg-gpio-driver-over-rpmsg-bus/20260305-052440
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20260304211808.1437846-5-shenwei.wang%40nxp.com
patch subject: [PATCH v9 4/5] gpio: rpmsg: add support for NXP legacy firmware protocol
config: x86_64-randconfig-161-20260306 (https://download.01.org/0day-ci/archive/20260306/202603060910.Q5zBquzF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603060910.Q5zBquzF-lkp@intel.com/

smatch warnings:
drivers/gpio/gpio-rpmsg.c:188 rpmsg_gpio_imx_send_fixed_up() error: buffer overflow 'imx_std_cmd_map' 7 <= 27

vim +/imx_std_cmd_map +188 drivers/gpio/gpio-rpmsg.c

49a0cb20cd49a59 Shenwei Wang 2026-03-04  176  static int rpmsg_gpio_imx_send_fixed_up(struct rpmsg_gpio_info *info,
49a0cb20cd49a59 Shenwei Wang 2026-03-04  177  				   struct rpmsg_gpio_packet *msg)
49a0cb20cd49a59 Shenwei Wang 2026-03-04  178  {
49a0cb20cd49a59 Shenwei Wang 2026-03-04  179  	struct rpmsg_gpio_nxp_packet imx_msg;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  180  
49a0cb20cd49a59 Shenwei Wang 2026-03-04  181  	if (msg->cmd >= sizeof(imx_std_cmd_map))

This looks like a sizeof() vs ARRAY_SIZE() bug.

49a0cb20cd49a59 Shenwei Wang 2026-03-04  182  		return -EINVAL;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  183  
49a0cb20cd49a59 Shenwei Wang 2026-03-04  184  	imx_msg.id = IMX_RPMSG_ID;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  185  	imx_msg.vendor = IMX_RPMSG_VENDOR;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  186  	imx_msg.version = IMX_RPMSG_VERSION;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  187  	imx_msg.type = msg->type;
49a0cb20cd49a59 Shenwei Wang 2026-03-04 @188  	imx_msg.cmd = imx_std_cmd_map[msg->cmd];
                                                                              ^^^^^^^^
Out of bounds.

49a0cb20cd49a59 Shenwei Wang 2026-03-04  189  	imx_msg.port_idx = msg->port_idx;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  190  	imx_msg.line = msg->line;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  191  	imx_msg.val1 = msg->val1;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  192  	imx_msg.val2 = msg->val2;
49a0cb20cd49a59 Shenwei Wang 2026-03-04  193  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

