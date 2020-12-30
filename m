Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA6FC433DB
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Dec 2020 15:21:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E1F4207A6
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Dec 2020 15:21:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726499AbgL3PV6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 30 Dec 2020 10:21:58 -0500
Received: from mga09.intel.com ([134.134.136.24]:39026 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726491AbgL3PV6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 30 Dec 2020 10:21:58 -0500
IronPort-SDR: Zx44ZLiOnLxpbVocdvuYYORr73lOxM4kC0OcZTXBI+5M51N3n4+oHjWqM24IlbNgBOgWA/TNGT
 jXc5RhawM/gA==
X-IronPort-AV: E=McAfee;i="6000,8403,9850"; a="176766870"
X-IronPort-AV: E=Sophos;i="5.78,461,1599548400"; 
   d="gz'50?scan'50,208,50";a="176766870"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2020 07:21:15 -0800
IronPort-SDR: kp7vQgkrmJZ5yqkO7XqatPtKwMLl1hgLnjbwV72f0fO+2oDiQHzObHRYqOaU2yQRkR/tAXULxf
 29vwXhM7bZHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,461,1599548400"; 
   d="gz'50?scan'50,208,50";a="395893857"
Received: from lkp-server02.sh.intel.com (HELO 4242b19f17ef) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 30 Dec 2020 07:21:12 -0800
Received: from kbuild by 4242b19f17ef with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kudHj-0004Kc-Q9; Wed, 30 Dec 2020 15:21:11 +0000
Date:   Wed, 30 Dec 2020 23:20:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     peng.fan@nxp.com, ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     kbuild-all@lists.01.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH V5 2/8] remoteproc: add is_iomem to da_to_va
Message-ID: <202012302337.ZHwIxeib-lkp@intel.com>
References: <20201229033019.25899-3-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline
In-Reply-To: <20201229033019.25899-3-peng.fan@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.11-rc1 next-20201223]
[cannot apply to soc/for-next xlnx/master remoteproc/for-next rpmsg/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/peng-fan-nxp-com/remoteproc-imx_rproc-support-iMX8MQ-M/20201229-110725
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git dea8dcf2a9fa8cc540136a6cd885c3beece16ec3
config: i386-randconfig-s001-20201230 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.3-184-g1b896707-dirty
        # https://github.com/0day-ci/linux/commit/f2054bc05d3b183ef0b0ff0b4c802ba53680a5af
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review peng-fan-nxp-com/remoteproc-imx_rproc-support-iMX8MQ-M/20201229-110725
        git checkout f2054bc05d3b183ef0b0ff0b4c802ba53680a5af
        # save the attached .config to linux build tree
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
>> drivers/remoteproc/remoteproc_elf_loader.c:219:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem * @@     got unsigned char const [usertype] * @@
   drivers/remoteproc/remoteproc_elf_loader.c:219:61: sparse:     expected void const volatile [noderef] __iomem *
   drivers/remoteproc/remoteproc_elf_loader.c:219:61: sparse:     got unsigned char const [usertype] *
>> drivers/remoteproc/remoteproc_elf_loader.c:233:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got void * @@
   drivers/remoteproc/remoteproc_elf_loader.c:233:47: sparse:     expected void volatile [noderef] __iomem *
   drivers/remoteproc/remoteproc_elf_loader.c:233:47: sparse:     got void *
--
>> drivers/remoteproc/remoteproc_coredump.c:169:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem * @@     got void *[assigned] ptr @@
   drivers/remoteproc/remoteproc_coredump.c:169:53: sparse:     expected void const volatile [noderef] __iomem *
   drivers/remoteproc/remoteproc_coredump.c:169:53: sparse:     got void *[assigned] ptr

vim +219 drivers/remoteproc/remoteproc_elf_loader.c

   131	
   132	/**
   133	 * rproc_elf_load_segments() - load firmware segments to memory
   134	 * @rproc: remote processor which will be booted using these fw segments
   135	 * @fw: the ELF firmware image
   136	 *
   137	 * This function loads the firmware segments to memory, where the remote
   138	 * processor expects them.
   139	 *
   140	 * Some remote processors will expect their code and data to be placed
   141	 * in specific device addresses, and can't have them dynamically assigned.
   142	 *
   143	 * We currently support only those kind of remote processors, and expect
   144	 * the program header's paddr member to contain those addresses. We then go
   145	 * through the physically contiguous "carveout" memory regions which we
   146	 * allocated (and mapped) earlier on behalf of the remote processor,
   147	 * and "translate" device address to kernel addresses, so we can copy the
   148	 * segments where they are expected.
   149	 *
   150	 * Currently we only support remote processors that required carveout
   151	 * allocations and got them mapped onto their iommus. Some processors
   152	 * might be different: they might not have iommus, and would prefer to
   153	 * directly allocate memory for every segment/resource. This is not yet
   154	 * supported, though.
   155	 */
   156	int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
   157	{
   158		struct device *dev = &rproc->dev;
   159		const void *ehdr, *phdr;
   160		int i, ret = 0;
   161		u16 phnum;
   162		const u8 *elf_data = fw->data;
   163		u8 class = fw_elf_get_class(fw);
   164		u32 elf_phdr_get_size = elf_size_of_phdr(class);
   165	
   166		ehdr = elf_data;
   167		phnum = elf_hdr_get_e_phnum(class, ehdr);
   168		phdr = elf_data + elf_hdr_get_e_phoff(class, ehdr);
   169	
   170		/* go through the available ELF segments */
   171		for (i = 0; i < phnum; i++, phdr += elf_phdr_get_size) {
   172			u64 da = elf_phdr_get_p_paddr(class, phdr);
   173			u64 memsz = elf_phdr_get_p_memsz(class, phdr);
   174			u64 filesz = elf_phdr_get_p_filesz(class, phdr);
   175			u64 offset = elf_phdr_get_p_offset(class, phdr);
   176			u32 type = elf_phdr_get_p_type(class, phdr);
   177			void *ptr;
   178			bool is_iomem;
   179	
   180			if (type != PT_LOAD)
   181				continue;
   182	
   183			dev_dbg(dev, "phdr: type %d da 0x%llx memsz 0x%llx filesz 0x%llx\n",
   184				type, da, memsz, filesz);
   185	
   186			if (filesz > memsz) {
   187				dev_err(dev, "bad phdr filesz 0x%llx memsz 0x%llx\n",
   188					filesz, memsz);
   189				ret = -EINVAL;
   190				break;
   191			}
   192	
   193			if (offset + filesz > fw->size) {
   194				dev_err(dev, "truncated fw: need 0x%llx avail 0x%zx\n",
   195					offset + filesz, fw->size);
   196				ret = -EINVAL;
   197				break;
   198			}
   199	
   200			if (!rproc_u64_fit_in_size_t(memsz)) {
   201				dev_err(dev, "size (%llx) does not fit in size_t type\n",
   202					memsz);
   203				ret = -EOVERFLOW;
   204				break;
   205			}
   206	
   207			/* grab the kernel address for this device address */
   208			ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
   209			if (!ptr) {
   210				dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
   211					memsz);
   212				ret = -EINVAL;
   213				break;
   214			}
   215	
   216			/* put the segment where the remote processor expects it */
   217			if (filesz) {
   218				if (is_iomem)
 > 219					memcpy_fromio(ptr, elf_data + offset, filesz);
   220				else
   221					memcpy(ptr, elf_data + offset, filesz);
   222			}
   223	
   224			/*
   225			 * Zero out remaining memory for this segment.
   226			 *
   227			 * This isn't strictly required since dma_alloc_coherent already
   228			 * did this for us. albeit harmless, we may consider removing
   229			 * this.
   230			 */
   231			if (memsz > filesz) {
   232				if (is_iomem)
 > 233					memset_io(ptr + filesz, 0, memsz - filesz);
   234				else
   235					memset(ptr + filesz, 0, memsz - filesz);
   236			}
   237		}
   238	
   239		return ret;
   240	}
   241	EXPORT_SYMBOL(rproc_elf_load_segments);
   242	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--CE+1k2dSO48ffgeK
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--CE+1k2dSO48ffgeK--
