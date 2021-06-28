Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6AEEC2B9F4
	for <linux-remoteproc@archiver.kernel.org>; Mon, 28 Jun 2021 08:53:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD6DB61C17
	for <linux-remoteproc@archiver.kernel.org>; Mon, 28 Jun 2021 08:53:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232282AbhF1Izw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 28 Jun 2021 04:55:52 -0400
Received: from mga02.intel.com ([134.134.136.20]:19658 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232430AbhF1Izw (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 28 Jun 2021 04:55:52 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10028"; a="195064758"
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; 
   d="gz'50?scan'50,208,50";a="195064758"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2021 01:53:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; 
   d="gz'50?scan'50,208,50";a="475487551"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Jun 2021 01:53:22 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lxn17-0008UK-RH; Mon, 28 Jun 2021 08:53:21 +0000
Date:   Mon, 28 Jun 2021 16:52:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, ohad@wizery.com,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        o.rempel@pengutronix.de
Cc:     kbuild-all@lists.01.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] remoteproc: elf_loader: fix loading segment when
 is_iomem true
Message-ID: <202106281601.7vHE0Go0-lkp@intel.com>
References: <20210628070657.7669-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline
In-Reply-To: <20210628070657.7669-1-peng.fan@oss.nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi "Peng,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v5.13 next-20210625]
[cannot apply to xlnx/master remoteproc/for-next rpmsg/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Peng-Fan-OSS/remoteproc-elf_loader-fix-loading-segment-when-is_iomem-true/20210628-143358
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
config: riscv-randconfig-s031-20210628 (attached as .config)
compiler: riscv64-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://github.com/0day-ci/linux/commit/2c90d7d15776bf485ad028de63002efbc2facc66
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Peng-Fan-OSS/remoteproc-elf_loader-fix-loading-segment-when-is_iomem-true/20210628-143358
        git checkout 2c90d7d15776bf485ad028de63002efbc2facc66
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=riscv 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/remoteproc/remoteproc_elf_loader.c:219:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[assigned] ptr @@
   drivers/remoteproc/remoteproc_elf_loader.c:219:45: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/remoteproc/remoteproc_elf_loader.c:219:45: sparse:     got void *[assigned] ptr
>> drivers/remoteproc/remoteproc_elf_loader.c:219:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *buffer @@     got void [noderef] __iomem * @@
   drivers/remoteproc/remoteproc_elf_loader.c:219:51: sparse:     expected void const *buffer
   drivers/remoteproc/remoteproc_elf_loader.c:219:51: sparse:     got void [noderef] __iomem *

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
 > 219					memcpy_toio(ptr, (void __iomem *)(elf_data + offset), filesz);
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
   233					memset_io((void __iomem *)(ptr + filesz), 0, memsz - filesz);
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

--LQksG6bCIzRHxTLp
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
QctmY6SZ7TvuLi/I9D8Hurq0+wsCAA==

--LQksG6bCIzRHxTLp--
