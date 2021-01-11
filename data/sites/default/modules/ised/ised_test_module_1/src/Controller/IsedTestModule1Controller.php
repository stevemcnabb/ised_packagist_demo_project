<?php

namespace Drupal\ised_test_module_1\Controller;

use Drupal\Core\Controller\ControllerBase;

/**
 * Returns responses for ISED Test Module 1 routes.
 */
class IsedTestModule1Controller extends ControllerBase {

  /**
   * Builds the response.
   */
  public function build() {

    $build['content'] = [
      '#type' => 'item',
      '#markup' => $this->t('I am the output from test module 1'),
    ];

    return $build;
  }

}
