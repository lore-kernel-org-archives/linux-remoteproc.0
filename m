Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CB81B218C;
	Wed, 16 Oct 2024 07:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729063269; cv=none; b=N+dmVqVa6Z3p7qLdLh+86prKInJAUsMXFMaLnK1n5hFgrjEql+ys0Bvvb8F/W1f/pGx4zgGu15KTdhX0iGiW/SJnxtY8eA6/6mSHJQywYhkFCaw+b/HJWuln6fvvt8UXkUpPXG2dB+jkFDrtEHv40x7SNG44+Q3L+K4RugwO0lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729063269; c=relaxed/simple;
	bh=tNLN0Hsi06h0KXDRSOvGs8YDS4+LPkihDOXR2+rrwcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W2IU2ve7yIeS3lc5dCM3urQCsI9l7AhSCQDDbAmmf2rrbnuW+ZKC8leLa4HXKpIJBV5PH4Luji9vKNZRLuZLYWxYdeg6t5B8d4ubigHsIG6kEj/BK7CjCnMw1h+zE3Pa7ILnvxHAde5gO83CrDUX73GI6Ix7tfFTpe8a2w+AsZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gBMq7vNl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gBMq7vNl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729063267; x=1760599267;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tNLN0Hsi06h0KXDRSOvGs8YDS4+LPkihDOXR2+rrwcg=;
  b=gBMq7vNl6qaQxlECDPTslBZ05W5h1xG1jUhen9pxoBKUlAVd/VDj8DK0
   CmUXyKnNUz8CfMgYfoPRgDXjaHCv//WstiBjQGKVrvrueO7pFjK12zAnz
   ak2q6L+ETwitAR0g46tVwsdYxuOTGyHekNZHQD3GXjm/+Gwm8OkBIXf5I
   yMzEo9WY/1tu7A3OekxMCzO/qjS/NP93rresQe/cfIXYMS8vlnJk9fjYa
   iBPwgWBJ5arlQk3Ce8PxTi1ODoXZeRZcfnS5FFphYsk4hsg4sRTRlJPJp
   /Wx7BUShz2w2NRqFhhjeabW3XS0F3HyXCTn3VeMdQyIFmbGB81ojZ7vOe
   w==;
X-CSE-ConnectionGUID: oXGVVx0cTMijhEA+m8qB3A==
X-CSE-MsgGUID: 4inUWa8DS+60AF1HPQ/Iog==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="32414800"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="32414800"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 00:21:06 -0700
X-CSE-ConnectionGUID: 7CFWPXKZTKKz3VQrwvcvWw==
X-CSE-MsgGUID: nMIp9oLsROGRICCG5IcKfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="83213005"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Oct 2024 00:21:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0yL7-000KUh-1L;
	Wed, 16 Oct 2024 07:21:01 +0000
Date: Wed, 16 Oct 2024 15:20:38 +0800
From: kernel test robot <lkp@intel.com>
To: anish kumar <yesanishhere@gmail.com>, andersson@kernel.org,
	mathieu.poirier@linaro.orgi, corbet@lwn.net
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	anish kumar <yesanishhere@gmail.com>
Subject: Re: [PATCH] remoteproc: Documentation: upgrade from staging.
Message-ID: <202410161444.jOKMsoGS-lkp@intel.com>
References: <20241015025831.65232-1-yesanishhere@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015025831.65232-1-yesanishhere@gmail.com>

Hi anish,

kernel test robot noticed the following build warnings:

[auto build test WARNING on remoteproc/rpmsg-next]
[also build test WARNING on remoteproc/rproc-next lwn/docs-next linus/master v6.12-rc3 next-20241015]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/anish-kumar/remoteproc-Documentation-upgrade-from-staging/20241015-105957
base:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rpmsg-next
patch link:    https://lore.kernel.org/r/20241015025831.65232-1-yesanishhere%40gmail.com
patch subject: [PATCH] remoteproc: Documentation: upgrade from staging.
reproduce: (https://download.01.org/0day-ci/archive/20241016/202410161444.jOKMsoGS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410161444.jOKMsoGS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
>> Warning: Documentation/remoteproc/rproc-kernel-api.rst references a file that doesn't exist: Documentation/remotproc/remoteproc-api.rst
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/staging/remoteproc.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
